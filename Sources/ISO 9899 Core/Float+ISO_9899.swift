extension Float {

    public var c: C {
        C(value: self)
    }

    public static var c: C.Type {
        C.self
    }

    public struct C {

        public let value: Float
    }
}

extension Float.C {

    @_transparent
    public func pow(_ y: Float) -> Float {
        ISO_9899.Math.pow(self.value, y)
    }

    @_transparent
    public var sqrt: Float {
        ISO_9899.Math.sqrt(self.value)
    }
}

extension Float.C {

    @_transparent
    public var sin: Float {
        ISO_9899.Math.sin(self.value)
    }

    @_transparent
    public var cos: Float {
        ISO_9899.Math.cos(self.value)
    }

    @_transparent
    public var tan: Float {
        ISO_9899.Math.tan(self.value)
    }

    @_transparent
    public var asin: Float {
        ISO_9899.Math.asin(self.value)
    }

    @_transparent
    public var acos: Float {
        ISO_9899.Math.acos(self.value)
    }

    @_transparent
    public var atan: Float {
        ISO_9899.Math.atan(self.value)
    }

    @_transparent
    public func atan2(_ x: Float) -> Float {
        ISO_9899.Math.atan2(self.value, x)
    }
}

extension Float.C {

    @_transparent
    public var exp: Float {
        ISO_9899.Math.exp(self.value)
    }

    @_transparent
    public var exp2: Float {
        ISO_9899.Math.exp2(self.value)
    }

    @_transparent
    public var log: Float {
        ISO_9899.Math.log(self.value)
    }

    @_transparent
    public var log2: Float {
        ISO_9899.Math.log2(self.value)
    }

    @_transparent
    public var log10: Float {
        ISO_9899.Math.log10(self.value)
    }
}

extension Float.C {

    @_transparent
    public var abs: Float {
        ISO_9899.Math.fabs(self.value)
    }

    @_transparent
    public func hypot(_ y: Float) -> Float {
        ISO_9899.Math.hypot(self.value, y)
    }

    @_transparent
    public var cbrt: Float {
        ISO_9899.Math.cbrt(self.value)
    }
}

extension Float.C {

    @_transparent
    public var ceil: Float {
        ISO_9899.Math.ceil(self.value)
    }

    @_transparent
    public var floor: Float {
        ISO_9899.Math.floor(self.value)
    }

    @_transparent
    public var round: Float {
        ISO_9899.Math.round(self.value)
    }

    @_transparent
    public var trunc: Float {
        ISO_9899.Math.trunc(self.value)
    }
}

extension Float.C {

    @_transparent
    public var sinh: Float {
        ISO_9899.Math.sinh(self.value)
    }

    @_transparent
    public var cosh: Float {
        ISO_9899.Math.cosh(self.value)
    }

    @_transparent
    public var tanh: Float {
        ISO_9899.Math.tanh(self.value)
    }

    @_transparent
    public var asinh: Float {
        ISO_9899.Math.asinh(self.value)
    }

    @_transparent
    public var acosh: Float {
        ISO_9899.Math.acosh(self.value)
    }

    @_transparent
    public var atanh: Float {
        ISO_9899.Math.atanh(self.value)
    }
}

extension Float.C {

    @_transparent
    public var expm1: Float {
        ISO_9899.Math.expm1(self.value)
    }

    @_transparent
    public var log1p: Float {
        ISO_9899.Math.log1p(self.value)
    }
}

extension Float.C {

    @_transparent
    public var erf: Float {
        ISO_9899.Math.erf(self.value)
    }

    @_transparent
    public var erfc: Float {
        ISO_9899.Math.erfc(self.value)
    }

    @_transparent
    public var tgamma: Float {
        ISO_9899.Math.tgamma(self.value)
    }

    @_transparent
    public var lgamma: Float {
        ISO_9899.Math.lgamma(self.value)
    }
}

extension Float.C {

    @_transparent
    public var rint: Float {
        ISO_9899.Math.rint(self.value)
    }

    @_transparent
    public var nearbyint: Float {
        ISO_9899.Math.nearbyint(self.value)
    }

    @_transparent
    public func roundedToInt() -> Int {
        ISO_9899.Math.lrint(self.value)
    }

    @_transparent
    public func roundedToInt64() -> Int64 {
        ISO_9899.Math.llrint(self.value)
    }

    @_transparent
    public func roundToInt() -> Int {
        ISO_9899.Math.lround(self.value)
    }

    @_transparent
    public func roundToInt64() -> Int64 {
        ISO_9899.Math.llround(self.value)
    }
}

extension Float.C {

    @_transparent
    public func mod(_ y: Float) -> Float {
        ISO_9899.Math.fmod(self.value, y)
    }

    @_transparent
    public func remainder(_ y: Float) -> Float {
        ISO_9899.Math.remainder(self.value, y)
    }

    @_transparent
    public func remquo(_ y: Float, _ quo: UnsafeMutablePointer<Int32>) -> Float {
        unsafe ISO_9899.Math.remquo(self.value, y, quo)
    }
}

extension Float.C {

    @_transparent
    public static func nan(_ tag: String = "") -> Float {
        tag.withCString { unsafe ISO_9899.Math.nanf($0) }
    }

    @_transparent
    public func withSign(of other: Float) -> Float {
        ISO_9899.Math.copysign(self.value, other)
    }

    @_transparent
    public func nextRepresentable(toward other: Float) -> Float {
        ISO_9899.Math.nextafter(self.value, other)
    }

    @_transparent
    public func nextRepresentableExtended(toward other: Double) -> Float {
        ISO_9899.Math.nexttoward(self.value, other)
    }
}

extension Float.C {

    @_transparent
    public var classification: ISO_9899.Math.FloatingPointClass {
        ISO_9899.Math.fpclassify(self.value)
    }

    @_transparent
    public var isFinite: Bool {
        ISO_9899.Math.isfinite(self.value)
    }

    @_transparent
    public var isInfinite: Bool {
        ISO_9899.Math.isinf(self.value)
    }

    @_transparent
    public var isNaN: Bool {
        ISO_9899.Math.isnan(self.value)
    }

    @_transparent
    public var isNormal: Bool {
        ISO_9899.Math.isnormal(self.value)
    }

    @_transparent
    public var hasNegativeSign: Bool {
        ISO_9899.Math.signbit(self.value)
    }
}

extension Float.C {

    @_transparent
    public func isGreater(than other: Float) -> Bool {
        ISO_9899.Math.isgreater(self.value, other)
    }

    @_transparent
    public func isGreaterOrEqual(to other: Float) -> Bool {
        ISO_9899.Math.isgreaterequal(self.value, other)
    }

    @_transparent
    public func isLess(than other: Float) -> Bool {
        ISO_9899.Math.isless(self.value, other)
    }

    @_transparent
    public func isLessOrEqual(to other: Float) -> Bool {
        ISO_9899.Math.islessequal(self.value, other)
    }

    @_transparent
    public func isNotEqual(to other: Float) -> Bool {
        ISO_9899.Math.islessgreater(self.value, other)
    }

    @_transparent
    public func isUnordered(with other: Float) -> Bool {
        ISO_9899.Math.isunordered(self.value, other)
    }
}

extension Float.C {

    @_transparent
    public func positiveDifference(from y: Float) -> Float {
        ISO_9899.Math.fdim(self.value, y)
    }

    @_transparent
    public func max(_ y: Float) -> Float {
        ISO_9899.Math.fmax(self.value, y)
    }

    @_transparent
    public func min(_ y: Float) -> Float {
        ISO_9899.Math.fmin(self.value, y)
    }

    @_transparent
    public func fma(_ y: Float, _ z: Float) -> Float {
        ISO_9899.Math.fma(self.value, y, z)
    }
}
