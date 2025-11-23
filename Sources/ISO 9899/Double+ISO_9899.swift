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
