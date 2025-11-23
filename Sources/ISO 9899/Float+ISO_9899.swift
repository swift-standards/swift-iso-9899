//
//  Float+ISO_9899.swift
//  swift-iso-9899
//
//  Ergonomic C math library access for Float
//

extension Float {
    /// Access to C standard library math functions via `.c` namespace
    ///
    /// Provides ergonomic access to ISO/IEC 9899:2018 Section 7.12 mathematical functions.
    /// All operations delegate to the authoritative `ISO_9899.Math` implementations.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let x: Float = 2.0
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

    /// C standard library math operations namespace for Float
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
        public let value: Float

        /// Creates a C math namespace wrapper
        ///
        /// - Parameter value: The value to wrap
        init(value: Float) {
            self.value = value
        }
    }
}

// MARK: - Power Functions (Section 7.12.7)

extension Float.C {
    /// Compute value raised to the power y
    ///
    /// Delegates to ``ISO_9899/Math/pow(_:_:)-2bdgq``
    @_transparent
    public func pow(_ y: Float) -> Float {
        ISO_9899.Math.pow(self.value, y)
    }

    /// Compute square root
    ///
    /// Delegates to ``ISO_9899/Math/sqrt(_:)-4hj4j``
    @_transparent
    public var sqrt: Float {
        ISO_9899.Math.sqrt(self.value)
    }
}

// MARK: - Trigonometric Functions (Section 7.12.4)

extension Float.C {
    /// Compute sine
    ///
    /// Delegates to ``ISO_9899/Math/sin(_:)-71rr4``
    @_transparent
    public var sin: Float {
        ISO_9899.Math.sin(self.value)
    }

    /// Compute cosine
    ///
    /// Delegates to ``ISO_9899/Math/cos(_:)-2rksv``
    @_transparent
    public var cos: Float {
        ISO_9899.Math.cos(self.value)
    }

    /// Compute tangent
    ///
    /// Delegates to ``ISO_9899/Math/tan(_:)-8ks7i``
    @_transparent
    public var tan: Float {
        ISO_9899.Math.tan(self.value)
    }

    /// Compute arc sine
    ///
    /// Delegates to ``ISO_9899/Math/asin(_:)-9yw9t``
    @_transparent
    public var asin: Float {
        ISO_9899.Math.asin(self.value)
    }

    /// Compute arc cosine
    ///
    /// Delegates to ``ISO_9899/Math/acos(_:)-68xbb``
    @_transparent
    public var acos: Float {
        ISO_9899.Math.acos(self.value)
    }

    /// Compute arc tangent
    ///
    /// Delegates to ``ISO_9899/Math/atan(_:)-1f0zd``
    @_transparent
    public var atan: Float {
        ISO_9899.Math.atan(self.value)
    }

    /// Compute arc tangent of value/x
    ///
    /// Delegates to ``ISO_9899/Math/atan2(_:_:)-8mqze``
    @_transparent
    public func atan2(_ x: Float) -> Float {
        ISO_9899.Math.atan2(self.value, x)
    }
}

// MARK: - Exponential and Logarithmic Functions (Section 7.12.6)

extension Float.C {
    /// Compute exponential (e raised to the power of value)
    ///
    /// Delegates to ``ISO_9899/Math/exp(_:)-2gfqq``
    @_transparent
    public var exp: Float {
        ISO_9899.Math.exp(self.value)
    }

    /// Compute 2 raised to the power of value
    ///
    /// Delegates to ``ISO_9899/Math/exp2(_:)-37c8i``
    @_transparent
    public var exp2: Float {
        ISO_9899.Math.exp2(self.value)
    }

    /// Compute natural logarithm (base e)
    ///
    /// Delegates to ``ISO_9899/Math/log(_:)-9nnay``
    @_transparent
    public var log: Float {
        ISO_9899.Math.log(self.value)
    }

    /// Compute base-2 logarithm
    ///
    /// Delegates to ``ISO_9899/Math/log2(_:)-19wm7``
    @_transparent
    public var log2: Float {
        ISO_9899.Math.log2(self.value)
    }

    /// Compute base-10 logarithm
    ///
    /// Delegates to ``ISO_9899/Math/log10(_:)-3lk4i``
    @_transparent
    public var log10: Float {
        ISO_9899.Math.log10(self.value)
    }
}

// MARK: - Absolute Value and Additional Power Functions (Section 7.12.7)

extension Float.C {
    /// Compute absolute value
    ///
    /// Delegates to ``ISO_9899/Math/fabs(_:)-92g9h``
    @_transparent
    public var fabs: Float {
        ISO_9899.Math.fabs(self.value)
    }

    /// Compute Euclidean distance (sqrt(value² + y²))
    ///
    /// Delegates to ``ISO_9899/Math/hypot(_:_:)-2fz3q``
    @_transparent
    public func hypot(_ y: Float) -> Float {
        ISO_9899.Math.hypot(self.value, y)
    }

    /// Compute cube root
    ///
    /// Delegates to ``ISO_9899/Math/cbrt(_:)-5wdri``
    @_transparent
    public var cbrt: Float {
        ISO_9899.Math.cbrt(self.value)
    }
}

// MARK: - Rounding Functions (Section 7.12.9)

extension Float.C {
    /// Round toward positive infinity
    ///
    /// Delegates to ``ISO_9899/Math/ceil(_:)-61a0k``
    @_transparent
    public var ceil: Float {
        ISO_9899.Math.ceil(self.value)
    }

    /// Round toward negative infinity
    ///
    /// Delegates to ``ISO_9899/Math/floor(_:)-4gv6i``
    @_transparent
    public var floor: Float {
        ISO_9899.Math.floor(self.value)
    }

    /// Round to nearest integer (ties away from zero)
    ///
    /// Delegates to ``ISO_9899/Math/round(_:)-4j6vs``
    @_transparent
    public var round: Float {
        ISO_9899.Math.round(self.value)
    }

    /// Round toward zero
    ///
    /// Delegates to ``ISO_9899/Math/trunc(_:)-1l1g3``
    @_transparent
    public var trunc: Float {
        ISO_9899.Math.trunc(self.value)
    }
}
