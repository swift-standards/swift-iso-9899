# Principled ISO C Byte String Representation in Swift

## Abstract

This paper presents a type-theoretic approach to representing ISO/IEC 9899 (C standard) byte strings in Swift. We argue that ISO C strings constitute a distinct semantic domain from operating system path strings, requiring independent type representation. Our design introduces `ISO_9899.String` with `Char = UInt8` on all platforms, faithfully capturing the byte-oriented semantics specified in the C standard while avoiding platform-dependent C type leakage into public Swift APIs. We employ Swift's ownership system (`~Copyable`, `~Escapable`) to encode resource management invariants at the type level, and demonstrate how a layered architecture separates concerns between standards-faithful representation, platform adaptation, and high-level bridging.

## 1. Introduction

The intersection of Swift and C presents subtle challenges in string representation. While Swift's `String` type provides Unicode-correct text handling with copy-on-write semantics, systems programming frequently requires interaction with C APIs that operate on null-terminated byte sequences. The naive approach—exposing C's `char*` directly via Swift's `CChar` type—introduces several problems:

1. **Platform-dependent signedness**: `CChar` maps to `Int8` on some platforms and `UInt8` on others, creating potential for subtle comparison bugs.

2. **Semantic conflation**: C's `<string.h>` functions operate on byte sequences, but file path APIs have divergent requirements across operating systems.

3. **Ownership ambiguity**: Raw pointers provide no compile-time guarantees about memory validity or ownership transfer.

This work addresses these challenges through a principled type design that separates the ISO C byte string domain from OS-native path strings, using Swift's type system to enforce correctness invariants.

## 2. Background and Motivation

### 2.1 ISO C String Specification

ISO/IEC 9899:2018 Section 7.24 specifies string handling functions operating on null-terminated sequences of `char`. Crucially, the standard defines byte-level operations using `unsigned char` semantics—`memcpy` copies bytes as `unsigned char`, and comparison functions treat characters as `unsigned char` for ordering purposes.

The C `char` type itself has implementation-defined signedness (C99 §6.2.5), but string operations consistently use unsigned semantics. This suggests that a faithful representation in a strongly-typed language should use an unsigned byte type.

### 2.2 The Platform Divergence Problem

Modern operating systems have divergent requirements for file system paths:

- **POSIX systems** (macOS, Linux): Paths are byte sequences, conventionally UTF-8 encoded, passed via `char*`.
- **Windows**: Unicode-correct paths require `wchar_t*` (UTF-16) via wide-character APIs like `_wfopen`. The narrow `char*` APIs use the Active Code Page (ACP), a legacy mechanism unsuitable for international text.

A type that conflates "ISO C byte strings" with "OS-native path strings" will be incorrect on at least one platform. On Windows, ISO C's `fopen(char*, char*)` accepts byte strings with ACP semantics, while correct path handling requires UTF-16.

### 2.3 Related Work

The `swift-string-primitives` package addresses OS-native path strings with platform-conditional character types (`CChar` on POSIX, `UInt16` on Windows). The `swift-strings` package provides bridging between string domains. This work focuses specifically on faithful ISO C semantics, complementing rather than replacing those packages.

## 3. Design Principles

Our design adheres to several principles:

**P1. No C Type Leakage**: Public Swift APIs must not expose `CChar`, `wchar_t`, or other C bridging types. These types exist for FFI convenience but carry platform-dependent semantics inappropriate for public interfaces.

**P2. Semantic Fidelity**: Types should faithfully represent their source domain. `ISO_9899.String` represents ISO C byte strings, not an abstraction over multiple string representations.

**P3. Ownership Encoding**: Memory safety invariants should be encoded in the type system using Swift's ownership annotations (`~Copyable`, `~Escapable`).

**P4. Layered Architecture**: Standards-faithful types should not perform platform normalization. Adaptation belongs in higher-level packages.

## 4. Type Design

### 4.1 Character Type

```swift
extension ISO_9899.String {
    public typealias Char = UInt8

    @inlinable
    public static var terminator: Char { 0 }
}
```

We define `Char = UInt8` unconditionally on all platforms. This choice reflects several considerations:

1. **Unsigned semantics**: Matches ISO C's use of `unsigned char` for byte operations.
2. **Consistent representation**: Unlike `CChar`, `UInt8` has identical semantics across all platforms.
3. **No C leakage**: `UInt8` is a native Swift type, not a C bridging artifact.

### 4.2 View Type (Borrowed Access)

```swift
public struct View: ~Copyable, ~Escapable {
    public let pointer: UnsafePointer<Char>

    @inlinable
    @_lifetime(borrow pointer)
    public init(_ pointer: UnsafePointer<Char>) {
        self.pointer = pointer
    }
}
```

The `View` type provides borrowed access to null-terminated byte sequences. The `~Escapable` constraint, enabled by Swift's experimental Lifetimes feature, ensures at compile time that a `View` cannot outlive its backing storage. This prevents use-after-free bugs that plague C string handling.

The `@_lifetime(borrow pointer)` annotation establishes that the `View`'s lifetime is bounded by the pointer's validity, enabling the compiler to reject escaping uses.

### 4.3 Owned Type (Heap Allocation)

```swift
public struct Owned: ~Copyable {
    @usableFromInline
    internal let pointer: UnsafeMutablePointer<Char>
    public let count: Int

    @inlinable
    deinit {
        pointer.deallocate()
    }
}
```

The `Owned` type manages heap-allocated byte strings with RAII semantics. The `~Copyable` constraint enforces unique ownership, preventing double-free bugs. The `deinit` deallocates storage, ensuring no memory leaks for properly used values.

This type resides in the "Hosted" target, which assumes heap allocation availability. The "Core" target provides only `View` and pure functions, suitable for embedded or freestanding environments.

### 4.4 C Shim Layer

All bridging between Swift's `UInt8*` and C's `char*` occurs in a C shim header:

```c
static inline uint8_t *iso9899_strcpy(uint8_t *dest, const uint8_t *src) {
    return (uint8_t *)strcpy((char *)dest, (const char *)src);
}
```

This contains type casting within the C layer, leaving Swift wrappers mechanically trivial and type-safe. The shim also provides const-correct overloads for search functions, correcting C's design flaw where functions like `strchr` return non-const pointers from const input.

## 5. Architectural Layering

Our design participates in a three-layer architecture:

```
┌─────────────────────────────────────────────────────┐
│                  swift-strings                       │
│         Bridging: Swift.String ↔ domains            │
└─────────────────────────────────────────────────────┘
                         │
         ┌───────────────┴───────────────┐
         ▼                               ▼
┌─────────────────────┐     ┌─────────────────────────┐
│   swift-iso-9899    │     │ swift-string-primitives │
│  ISO C byte strings │     │  OS-native path strings │
│   Char = UInt8      │     │ Char = CChar / UInt16   │
└─────────────────────┘     └─────────────────────────┘
```

**swift-iso-9899** (this package): Faithful ISO C semantics. `Char = UInt8` always. Used for C library interop where byte-level control is required.

**swift-string-primitives**: OS-native path strings. `Char` varies by platform to match OS API requirements. Used for file system operations requiring platform-correct encoding.

**swift-strings**: High-level bridging layer providing extension initializers for conversion between `Swift.String`, `ISO_9899.String`, and `String_Primitives.String`.

This separation ensures each layer has a single responsibility and clear semantics.

## 6. The Windows Case Study

Windows provides the clearest validation of our architectural separation. Consider file operations:

```swift
// ISO C semantics: fopen with ACP byte encoding
let isoPath: ISO_9899.String.Owned = ...
fopen(isoPath.pointer, "r")  // Works, but ACP-limited

// OS-native semantics: _wfopen with UTF-16
let nativePath: String_Primitives.String = ...
_wfopen(nativePath.pointer, L"r")  // Unicode-correct
```

If `ISO_9899.String` were a typealias to `String_Primitives.String`, on Windows it would have `Char = UInt16`. But ISO C's `<string.h>` functions operate on `char*` (bytes), not `wchar_t*`. The type mismatch would prevent compilation of correct code.

By maintaining separate types, we enable:
- `ISO_9899.String` for byte-level C interop (always `UInt8`)
- `String_Primitives.String` for OS-native paths (UTF-16 on Windows)
- Explicit conversion through `swift-strings` when crossing domains

## 7. Core/Hosted Separation

The package separates into two targets with mechanical enforcement:

**ISO 9899 Core**: No heap allocation assumption.
- `ISO_9899.String.Char`, `View`, pure functions
- `ISO_9899.Errno`, `ISO_9899.Math`
- Suitable for embedded/freestanding environments

**ISO 9899 Hosted**: Requires heap allocation.
- `ISO_9899.String.Owned`
- `ISO_9899.Stdlib` (malloc, free, etc.)
- `ISO_9899.Ctype`

This mirrors the C standard's freestanding/hosted distinction (C99 §4), allowing the Core subset to be used in minimal environments while Hosted provides full functionality.

## 8. Evaluation

### 8.1 Type Safety

Our design eliminates several bug classes:

- **Signedness bugs**: `UInt8` has consistent unsigned semantics.
- **Use-after-free**: `~Escapable` on `View` prevents escaping borrows.
- **Double-free**: `~Copyable` on `Owned` enforces unique ownership.
- **Memory leaks**: RAII via `deinit` ensures deallocation.

### 8.2 Platform Correctness

By defining `Char = UInt8` unconditionally, code using `ISO_9899.String` has identical semantics across platforms. Platform-specific behavior is explicitly handled in higher layers (`swift-string-primitives` for paths, `swift-strings` for bridging).

### 8.3 Interoperability

The C shim approach enables zero-overhead calls to C library functions while maintaining type safety at the Swift level. The `@inline(__always)` annotations on wrapper functions ensure no abstraction penalty.

## 9. Limitations and Future Work

**Experimental Features**: The `~Escapable` constraint requires Swift's experimental Lifetimes feature, not yet stabilized.

**Encoding Assumptions**: Conversions through `swift-strings` assume UTF-8 for ISO C strings. Explicit encoding parameters could support legacy encodings.

**Tokenization**: ISO C's `strtok` function uses global state incompatible with Swift's concurrency model. A redesigned stateless tokenizer would be valuable.

## 10. Conclusion

We have presented a principled approach to representing ISO C byte strings in Swift that:

1. Uses `UInt8` consistently, avoiding C type leakage and signedness ambiguity.
2. Employs Swift's ownership system to encode memory safety invariants.
3. Maintains clear separation from OS-native path strings.
4. Enables correct cross-platform behavior through explicit type boundaries.

The design demonstrates that faithful representation of external standards, combined with Swift's advanced type features, yields APIs that are both safe and semantically precise.

## References

1. ISO/IEC 9899:2018. Programming languages — C.
2. The Swift Programming Language: Ownership.
3. swift-string-primitives: OS-native path string representation.
4. swift-strings: String domain bridging layer.
