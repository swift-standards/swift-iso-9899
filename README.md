# swift-iso-9899

Foundation-free Swift implementation of ISO/IEC 9899 (C Standard) mathematical functions.

## Overview

This package provides Swift access to mathematical functions defined in **ISO/IEC 9899:2018 Section 7.12 (Mathematics)** without requiring Foundation. It wraps the platform's standard C math library with a clean, type-safe Swift API.

## Why ISO 9899?

- **IEEE 754-2019** only *recommends* mathematical functions (Clause 9), doesn't require them
- **ISO/IEC 9899** (C Standard) *defines* the complete math library in Section 7.12
- ISO 9899 specifies function prototypes, behavior, and semantics
- This is the authoritative standard for mathematical function interfaces

## Features

### Power Functions (Section 7.12.7)
- `pow(_:_:)` - Compute x raised to the power y
- `sqrt(_:)` - Compute square root

### Trigonometric Functions (Section 7.12.4)
- `sin(_:)`, `cos(_:)`, `tan(_:)` - Basic trigonometric functions
- `asin(_:)`, `acos(_:)`, `atan(_:)` - Inverse trigonometric functions
- `atan2(_:_:)` - Arc tangent of y/x with quadrant information

### Rounding Functions (Section 7.12.9)
- `ceil(_:)` - Round toward positive infinity
- `floor(_:)` - Round toward negative infinity
- `round(_:)` - Round to nearest integer (ties away from zero)
- `trunc(_:)` - Round toward zero

These implement IEEE 754 roundToIntegral operations per Annex F.

## Usage

```swift
import ISO_9899

// Power functions
let power = ISO_9899.Math.pow(2.0, 3.0)  // 8.0
let gamma = ISO_9899.Math.pow(c, 1.0/2.4)  // Gamma correction
let root = ISO_9899.Math.sqrt(16.0)  // 4.0

// Trigonometric functions
let sine = ISO_9899.Math.sin(.pi / 2)  // 1.0
let cosine = ISO_9899.Math.cos(0)  // 1.0
let angle = ISO_9899.Math.atan2(1.0, 1.0)  // π/4

// Rounding functions
let rounded = ISO_9899.Math.ceil(2.3)   // 3.0
let floored = ISO_9899.Math.floor(2.7)  // 2.0
let nearest = ISO_9899.Math.round(2.5)  // 3.0 (ties away from zero)
let truncated = ISO_9899.Math.trunc(-2.7)  // -2.0

// Works with Float too
let f: Float = ISO_9899.Math.sin(Float.pi / 4)
```

## Platform Support

- **macOS 13+**
- **iOS 16+**
- **tvOS 16+**
- **watchOS 9+**
- **Linux** (via Glibc)
- **Windows** (via UCRT)

## Implementation

The package consists of:
1. **CISO9899Math** - C module providing platform-agnostic wrappers
2. **ISO 9899** - Swift interface with clean API and documentation

All functions are inlined for optimal performance.

## Standards Reference

- **ISO/IEC 9899:2018** - Programming Languages — C
  - Section 7.12: Mathematics `<math.h>`
  - Section 7.12.4: Trigonometric functions
  - Section 7.12.6: Exponential and logarithmic functions
  - Section 7.12.7: Power and absolute-value functions
  - Section 7.12.9: Rounding functions
  - Annex F: IEC 60559 floating-point arithmetic (IEEE 754 compliance)

## Requirements

- Swift 6.0+
- No Foundation dependency
- Platform C standard library

## License

Apache 2.0
