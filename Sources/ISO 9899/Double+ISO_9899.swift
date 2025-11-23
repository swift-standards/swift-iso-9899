//
//  Double+ISO_9899.swift
//  swift-iso-9899
//
//  Ergonomic C math library access for Double
//

extension Double {
    /// Access to C standard library math functions via `.c` namespace
    ///
    /// Provides ergonomic access to ISO/IEC 9899:2018 Section 7.12 mathematical functions.
    /// All operations delegate to the authoritative `ISO_9899.Math` implementations.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let x = 2.0
    /// let squared = x.c.pow(3.0)        // 8.0
    /// let root = x.c.sqrt               // 1.41421356...
    /// let sine = x.c.sin                // 0.90929742...
    /// let log = x.c.log                 // 0.693147180...
    /// let abs = (-x).c.fabs             // 2.0
    /// ```
    ///
    /// ## See Also
    ///
    /// - ``ISO_9899/Math``
    public var c: C {
        C(value: self)
    }

    /// C standard library math operations namespace for Double
    ///
    /// Provides ergonomic instance access to C math functions.
    /// All methods delegate to the authoritative ``ISO_9899/Math`` static implementations.
    ///
    /// ## Performance
    ///
    /// Methods are marked `@_transparent` for zero-overhead delegation.
    ///
    /// ## See Also
    ///
    /// - ``ISO_9899/Math``
    public struct C {
        /// The wrapped value
        public let value: Double

        /// Creates a C math namespace wrapper
        ///
        /// - Parameter value: The value to wrap
        init(value: Double) {
            self.value = value
        }
    }
}

// MARK: - Power Functions (Section 7.12.7)

extension Double.C {
    /// Compute value raised to the power y
    ///
    /// Delegates to ``ISO_9899/Math/pow(_:_:)-8bkqy``
    @_transparent
    public func pow(_ y: Double) -> Double {
        ISO_9899.Math.pow(self.value, y)
    }

    /// Compute square root
    ///
    /// Delegates to ``ISO_9899/Math/sqrt(_:)-76te9``
    @_transparent
    public var sqrt: Double {
        ISO_9899.Math.sqrt(self.value)
    }
}

// MARK: - Trigonometric Functions (Section 7.12.4)

extension Double.C {
    /// Compute sine
    ///
    /// Delegates to ``ISO_9899/Math/sin(_:)-92zgc``
    @_transparent
    public var sin: Double {
        ISO_9899.Math.sin(self.value)
    }

    /// Compute cosine
    ///
    /// Delegates to ``ISO_9899/Math/cos(_:)-9mjql``
    @_transparent
    public var cos: Double {
        ISO_9899.Math.cos(self.value)
    }

    /// Compute tangent
    ///
    /// Delegates to ``ISO_9899/Math/tan(_:)-75fpe``
    @_transparent
    public var tan: Double {
        ISO_9899.Math.tan(self.value)
    }

    /// Compute arc sine
    ///
    /// Delegates to ``ISO_9899/Math/asin(_:)-2owrm``
    @_transparent
    public var asin: Double {
        ISO_9899.Math.asin(self.value)
    }

    /// Compute arc cosine
    ///
    /// Delegates to ``ISO_9899/Math/acos(_:)-8vv76``
    @_transparent
    public var acos: Double {
        ISO_9899.Math.acos(self.value)
    }

    /// Compute arc tangent
    ///
    /// Delegates to ``ISO_9899/Math/atan(_:)-26k4r``
    @_transparent
    public var atan: Double {
        ISO_9899.Math.atan(self.value)
    }

    /// Compute arc tangent of value/x
    ///
    /// Delegates to ``ISO_9899/Math/atan2(_:_:)-47htk``
    @_transparent
    public func atan2(_ x: Double) -> Double {
        ISO_9899.Math.atan2(self.value, x)
    }
}

// MARK: - Exponential and Logarithmic Functions (Section 7.12.6)

extension Double.C {
    /// Compute exponential (e raised to the power of value)
    ///
    /// Delegates to ``ISO_9899/Math/exp(_:)-9rfoc``
    @_transparent
    public var exp: Double {
        ISO_9899.Math.exp(self.value)
    }

    /// Compute 2 raised to the power of value
    ///
    /// Delegates to ``ISO_9899/Math/exp2(_:)-4z5e0``
    @_transparent
    public var exp2: Double {
        ISO_9899.Math.exp2(self.value)
    }

    /// Compute natural logarithm (base e)
    ///
    /// Delegates to ``ISO_9899/Math/log(_:)-52pz2``
    @_transparent
    public var log: Double {
        ISO_9899.Math.log(self.value)
    }

    /// Compute base-2 logarithm
    ///
    /// Delegates to ``ISO_9899/Math/log2(_:)-6rqou``
    @_transparent
    public var log2: Double {
        ISO_9899.Math.log2(self.value)
    }

    /// Compute base-10 logarithm
    ///
    /// Delegates to ``ISO_9899/Math/log10(_:)-1avzx``
    @_transparent
    public var log10: Double {
        ISO_9899.Math.log10(self.value)
    }
}

// MARK: - Absolute Value and Additional Power Functions (Section 7.12.7)

extension Double.C {
    /// Compute absolute value
    ///
    /// Delegates to ``ISO_9899/Math/fabs(_:)-1w0zq``
    @_transparent
    public var fabs: Double {
        ISO_9899.Math.fabs(self.value)
    }

    /// Compute Euclidean distance (sqrt(value² + y²))
    ///
    /// Delegates to ``ISO_9899/Math/hypot(_:_:)-6ji3h``
    @_transparent
    public func hypot(_ y: Double) -> Double {
        ISO_9899.Math.hypot(self.value, y)
    }

    /// Compute cube root
    ///
    /// Delegates to ``ISO_9899/Math/cbrt(_:)-3c51f``
    @_transparent
    public var cbrt: Double {
        ISO_9899.Math.cbrt(self.value)
    }
}

// MARK: - Rounding Functions (Section 7.12.9)

extension Double.C {
    /// Round toward positive infinity
    ///
    /// Delegates to ``ISO_9899/Math/ceil(_:)-7uv0y``
    @_transparent
    public var ceil: Double {
        ISO_9899.Math.ceil(self.value)
    }

    /// Round toward negative infinity
    ///
    /// Delegates to ``ISO_9899/Math/floor(_:)-9i2dy``
    @_transparent
    public var floor: Double {
        ISO_9899.Math.floor(self.value)
    }

    /// Round to nearest integer (ties away from zero)
    ///
    /// Delegates to ``ISO_9899/Math/round(_:)-53nty``
    @_transparent
    public var round: Double {
        ISO_9899.Math.round(self.value)
    }

    /// Round toward zero
    ///
    /// Delegates to ``ISO_9899/Math/trunc(_:)-7abaz``
    @_transparent
    public var trunc: Double {
        ISO_9899.Math.trunc(self.value)
    }
}

// MARK: - Hyperbolic Functions (Section 7.12.5)

extension Double.C {
    /// Compute hyperbolic sine
    ///
    /// Delegates to ``ISO_9899/Math/sinh(_:)-92zgc``
    @_transparent
    public var sinh: Double {
        ISO_9899.Math.sinh(self.value)
    }

    /// Compute hyperbolic cosine
    ///
    /// Delegates to ``ISO_9899/Math/cosh(_:)-9mjql``
    @_transparent
    public var cosh: Double {
        ISO_9899.Math.cosh(self.value)
    }

    /// Compute hyperbolic tangent
    ///
    /// Delegates to ``ISO_9899/Math/tanh(_:)-75fpe``
    @_transparent
    public var tanh: Double {
        ISO_9899.Math.tanh(self.value)
    }

    /// Compute inverse hyperbolic sine
    ///
    /// Delegates to ``ISO_9899/Math/asinh(_:)-2owrm``
    @_transparent
    public var asinh: Double {
        ISO_9899.Math.asinh(self.value)
    }

    /// Compute inverse hyperbolic cosine
    ///
    /// Delegates to ``ISO_9899/Math/acosh(_:)-8vv76``
    @_transparent
    public var acosh: Double {
        ISO_9899.Math.acosh(self.value)
    }

    /// Compute inverse hyperbolic tangent
    ///
    /// Delegates to ``ISO_9899/Math/atanh(_:)-26k4r``
    @_transparent
    public var atanh: Double {
        ISO_9899.Math.atanh(self.value)
    }
}

// MARK: - Special Exponential/Logarithmic Functions (Section 7.12.6)

extension Double.C {
    /// Compute exp(x) - 1
    ///
    /// Delegates to ``ISO_9899/Math/expm1(_:)-9rfoc``
    @_transparent
    public var expm1: Double {
        ISO_9899.Math.expm1(self.value)
    }

    /// Compute log(1 + x)
    ///
    /// Delegates to ``ISO_9899/Math/log1p(_:)-52pz2``
    @_transparent
    public var log1p: Double {
        ISO_9899.Math.log1p(self.value)
    }
}

// MARK: - Error and Gamma Functions (Section 7.12.8)

extension Double.C {
    /// Compute error function
    ///
    /// Delegates to ``ISO_9899/Math/erf(_:)-1w0zq``
    @_transparent
    public var erf: Double {
        ISO_9899.Math.erf(self.value)
    }

    /// Compute complementary error function
    ///
    /// Delegates to ``ISO_9899/Math/erfc(_:)-6ji3h``
    @_transparent
    public var erfc: Double {
        ISO_9899.Math.erfc(self.value)
    }

    /// Compute gamma function
    ///
    /// Delegates to ``ISO_9899/Math/tgamma(_:)-3c51f``
    @_transparent
    public var tgamma: Double {
        ISO_9899.Math.tgamma(self.value)
    }

    /// Compute natural logarithm of gamma function
    ///
    /// Delegates to ``ISO_9899/Math/lgamma(_:)-7uv0y``
    @_transparent
    public var lgamma: Double {
        ISO_9899.Math.lgamma(self.value)
    }
}

// MARK: - Additional Rounding Functions (Section 7.12.9)

extension Double.C {
    /// Round to nearest integer using current rounding direction
    ///
    /// Delegates to ``ISO_9899/Math/rint(_:)-9i2dy``
    @_transparent
    public var rint: Double {
        ISO_9899.Math.rint(self.value)
    }

    /// Round to nearest integer without raising inexact exception
    ///
    /// Delegates to ``ISO_9899/Math/nearbyint(_:)-53nty``
    @_transparent
    public var nearbyint: Double {
        ISO_9899.Math.nearbyint(self.value)
    }

    /// Round to nearest integer and return as Int
    ///
    /// Delegates to ``ISO_9899/Math/lrint(_:)-7abaz``
    @_transparent
    public var lrint: Int {
        ISO_9899.Math.lrint(self.value)
    }

    /// Round to nearest integer and return as Int64
    ///
    /// Delegates to ``ISO_9899/Math/llrint(_:)-61a0k``
    @_transparent
    public var llrint: Int64 {
        ISO_9899.Math.llrint(self.value)
    }

    /// Round (ties away from zero) and return as Int
    ///
    /// Delegates to ``ISO_9899/Math/lround(_:)-4gv6i``
    @_transparent
    public var lround: Int {
        ISO_9899.Math.lround(self.value)
    }

    /// Round (ties away from zero) and return as Int64
    ///
    /// Delegates to ``ISO_9899/Math/llround(_:)-4j6vs``
    @_transparent
    public var llround: Int64 {
        ISO_9899.Math.llround(self.value)
    }
}

// MARK: - Remainder Functions (Section 7.12.10)

extension Double.C {
    /// Compute floating-point remainder
    ///
    /// Delegates to ``ISO_9899/Math/fmod(_:_:)-47htk``
    @_transparent
    public func fmod(_ y: Double) -> Double {
        ISO_9899.Math.fmod(self.value, y)
    }

    /// Compute IEEE remainder
    ///
    /// Delegates to ``ISO_9899/Math/remainder(_:_:)-8bkqy``
    @_transparent
    public func remainder(_ y: Double) -> Double {
        ISO_9899.Math.remainder(self.value, y)
    }

    /// Compute remainder and quotient
    ///
    /// Delegates to ``ISO_9899/Math/remquo(_:_:_:)-2bdgq``
    @_transparent
    public func remquo(_ y: Double, _ quo: UnsafeMutablePointer<Int32>) -> Double {
        ISO_9899.Math.remquo(self.value, y, quo)
    }
}

// MARK: - Manipulation Functions (Section 7.12.11)

extension Double.C {
    /// Copy sign from another value
    ///
    /// Delegates to ``ISO_9899/Math/copysign(_:_:)-76te9``
    @_transparent
    public func copysign(_ y: Double) -> Double {
        ISO_9899.Math.copysign(self.value, y)
    }

    /// Get next representable value toward y
    ///
    /// Delegates to ``ISO_9899/Math/nextafter(_:_:)-4hj4j``
    @_transparent
    public func nextafter(_ y: Double) -> Double {
        ISO_9899.Math.nextafter(self.value, y)
    }

    /// Get next representable value toward y (long double)
    ///
    /// Delegates to ``ISO_9899/Math/nexttoward(_:_:)-71rr4``
    @_transparent
    public func nexttoward(_ y: Double) -> Double {
        ISO_9899.Math.nexttoward(self.value, y)
    }
}

// MARK: - Classification Functions (Section 7.12.3)

extension Double.C {
    /// Classify floating-point value
    ///
    /// Delegates to ``ISO_9899/Math/fpclassify(_:)-76te9``
    @_transparent
    public var fpclassify: ISO_9899.Math.FloatingPointClass {
        ISO_9899.Math.fpclassify(self.value)
    }

    /// Test for finite value
    ///
    /// Delegates to ``ISO_9899/Math/isfinite(_:)-76te9``
    @_transparent
    public var isfinite: Bool {
        ISO_9899.Math.isfinite(self.value)
    }

    /// Test for infinity
    ///
    /// Delegates to ``ISO_9899/Math/isinf(_:)-76te9``
    @_transparent
    public var isinf: Bool {
        ISO_9899.Math.isinf(self.value)
    }

    /// Test for NaN
    ///
    /// Delegates to ``ISO_9899/Math/isnan(_:)-76te9``
    @_transparent
    public var isnan: Bool {
        ISO_9899.Math.isnan(self.value)
    }

    /// Test for normal value
    ///
    /// Delegates to ``ISO_9899/Math/isnormal(_:)-76te9``
    @_transparent
    public var isnormal: Bool {
        ISO_9899.Math.isnormal(self.value)
    }

    /// Test sign bit
    ///
    /// Delegates to ``ISO_9899/Math/signbit(_:)-76te9``
    @_transparent
    public var signbit: Bool {
        ISO_9899.Math.signbit(self.value)
    }
}

// MARK: - Comparison Macros (Section 7.12.14)

extension Double.C {
    /// Determine whether value > y (quiet comparison)
    ///
    /// Delegates to ``ISO_9899/Math/isgreater(_:_:)-76te9``
    @_transparent
    public func isgreater(_ y: Double) -> Bool {
        ISO_9899.Math.isgreater(self.value, y)
    }

    /// Determine whether value >= y (quiet comparison)
    ///
    /// Delegates to ``ISO_9899/Math/isgreaterequal(_:_:)-76te9``
    @_transparent
    public func isgreaterequal(_ y: Double) -> Bool {
        ISO_9899.Math.isgreaterequal(self.value, y)
    }

    /// Determine whether value < y (quiet comparison)
    ///
    /// Delegates to ``ISO_9899/Math/isless(_:_:)-76te9``
    @_transparent
    public func isless(_ y: Double) -> Bool {
        ISO_9899.Math.isless(self.value, y)
    }

    /// Determine whether value <= y (quiet comparison)
    ///
    /// Delegates to ``ISO_9899/Math/islessequal(_:_:)-76te9``
    @_transparent
    public func islessequal(_ y: Double) -> Bool {
        ISO_9899.Math.islessequal(self.value, y)
    }

    /// Determine whether value < y or value > y (quiet comparison)
    ///
    /// Delegates to ``ISO_9899/Math/islessgreater(_:_:)-76te9``
    @_transparent
    public func islessgreater(_ y: Double) -> Bool {
        ISO_9899.Math.islessgreater(self.value, y)
    }

    /// Determine whether arguments are unordered
    ///
    /// Delegates to ``ISO_9899/Math/isunordered(_:_:)-76te9``
    @_transparent
    public func isunordered(_ y: Double) -> Bool {
        ISO_9899.Math.isunordered(self.value, y)
    }
}

// MARK: - Maximum, Minimum, and FMA (Sections 7.12.12, 7.12.13)

extension Double.C {
    /// Compute positive difference
    ///
    /// Delegates to ``ISO_9899/Math/fdim(_:_:)-2rksv``
    @_transparent
    public func fdim(_ y: Double) -> Double {
        ISO_9899.Math.fdim(self.value, y)
    }

    /// Determine maximum value
    ///
    /// Delegates to ``ISO_9899/Math/fmax(_:_:)-8ks7i``
    @_transparent
    public func fmax(_ y: Double) -> Double {
        ISO_9899.Math.fmax(self.value, y)
    }

    /// Determine minimum value
    ///
    /// Delegates to ``ISO_9899/Math/fmin(_:_:)-9yw9t``
    @_transparent
    public func fmin(_ y: Double) -> Double {
        ISO_9899.Math.fmin(self.value, y)
    }

    /// Fused multiply-add: (value × y) + z
    ///
    /// Delegates to ``ISO_9899/Math/fma(_:_:_:)-68xbb``
    @_transparent
    public func fma(_ y: Double, _ z: Double) -> Double {
        ISO_9899.Math.fma(self.value, y, z)
    }
}
