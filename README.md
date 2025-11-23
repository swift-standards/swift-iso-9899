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

### Trigonometric Functions (Section 7.12.4)
- `sin(_:)`, `cos(_:)`, `tan(_:)` - Basic trigonometric functions
- `asin(_:)`, `acos(_:)`, `atan(_:)` - Inverse trigonometric functions
- `atan2(_:_:)` - Arc tangent of y/x with quadrant information

### Exponential and Logarithmic Functions (Section 7.12.6)
- `exp(_:)` - Compute e raised to the power x
- `exp2(_:)` - Compute 2 raised to the power x
- `log(_:)` - Compute natural logarithm (base e)
- `log2(_:)` - Compute base-2 logarithm
- `log10(_:)` - Compute base-10 logarithm

### Power and Absolute-Value Functions (Section 7.12.7)
- `pow(_:_:)` - Compute x raised to the power y
- `sqrt(_:)` - Compute square root
- `fabs(_:)` - Compute absolute value
- `hypot(_:_:)` - Compute Euclidean distance (sqrt(x² + y²))
- `cbrt(_:)` - Compute cube root

### Rounding Functions (Section 7.12.9)
- `ceil(_:)` - Round toward positive infinity
- `floor(_:)` - Round toward negative infinity
- `round(_:)` - Round to nearest integer (ties away from zero)
- `trunc(_:)` - Round toward zero

These implement IEEE 754 roundToIntegral operations per Annex F.

## Usage

### Direct Namespace Access

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

// Exponential and logarithmic functions
let e = ISO_9899.Math.exp(1.0)  // 2.71828...
let power2 = ISO_9899.Math.exp2(10.0)  // 1024.0
let ln = ISO_9899.Math.log(2.71828)  // 1.0
let log2 = ISO_9899.Math.log2(1024.0)  // 10.0

// Absolute value and additional power functions
let abs = ISO_9899.Math.fabs(-3.14)  // 3.14
let dist = ISO_9899.Math.hypot(3.0, 4.0)  // 5.0
let cubeRoot = ISO_9899.Math.cbrt(27.0)  // 3.0

// Rounding functions
let rounded = ISO_9899.Math.ceil(2.3)   // 3.0
let floored = ISO_9899.Math.floor(2.7)  // 2.0
let nearest = ISO_9899.Math.round(2.5)  // 3.0 (ties away from zero)
let truncated = ISO_9899.Math.trunc(-2.7)  // -2.0

// Works with Float too
let f: Float = ISO_9899.Math.sin(Float.pi / 4)
```

### Ergonomic `.c` Namespace (Swifty API)

```swift
import ISO_9899

let x = 2.0

// Power functions
let squared = x.c.pow(3.0)      // 8.0
let root = x.c.sqrt             // 1.41421356...

// Trigonometric functions
let sine = x.c.sin              // 0.90929742...
let cosine = x.c.cos            // -0.41614683...
let tangent = x.c.tan           // -2.18503986...

// Exponential and logarithmic functions
let exp = x.c.exp               // 7.389056...
let log = x.c.log               // 0.693147180...
let log2 = x.c.log2             // 1.0

// Absolute value and additional power functions
let abs = (-x).c.fabs           // 2.0
let dist = x.c.hypot(3.0)       // 3.60555127...
let cube = x.c.cbrt             // 1.25992104...

// Rounding functions
let ceil = (2.3).c.ceil         // 3.0
let floor = (2.7).c.floor       // 2.0
let round = (2.5).c.round       // 3.0
let trunc = (-2.7).c.trunc      // -2.0

// Works with Float too
let y: Float = 1.5
let result = y.c.sqrt           // 1.22474487
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
