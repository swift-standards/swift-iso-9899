extension Double {

    public var c: C {
        C(value: self)
    }

    public static var c: C.Type {
        C.self
    }

    public struct C {

        public let value: Double
    }
}

extension Double.C {

    @_transparent
    public func pow(_ y: Double) -> Double {
        ISO_9899.Math.pow(self.value, y)
    }

    @_transparent
    public var sqrt: Double {
        ISO_9899.Math.sqrt(self.value)
    }
}

extension Double.C {

    @_transparent
    public var sin: Double {
        ISO_9899.Math.sin(self.value)
    }

    @_transparent
    public var cos: Double {
        ISO_9899.Math.cos(self.value)
    }

    @_transparent
    public var tan: Double {
        ISO_9899.Math.tan(self.value)
    }

    @_transparent
    public var asin: Double {
        ISO_9899.Math.asin(self.value)
    }

    @_transparent
    public var acos: Double {
        ISO_9899.Math.acos(self.value)
    }

    @_transparent
    public var atan: Double {
        ISO_9899.Math.atan(self.value)
    }

    @_transparent
    public func atan2(_ x: Double) -> Double {
        ISO_9899.Math.atan2(self.value, x)
    }
}

extension Double.C {

    @_transparent
    public var exp: Double {
        ISO_9899.Math.exp(self.value)
    }

    @_transparent
    public var exp2: Double {
        ISO_9899.Math.exp2(self.value)
    }

    @_transparent
    public var log: Double {
        ISO_9899.Math.log(self.value)
    }

    @_transparent
    public var log2: Double {
        ISO_9899.Math.log2(self.value)
    }

    @_transparent
    public var log10: Double {
        ISO_9899.Math.log10(self.value)
    }
}

extension Double.C {

    @_transparent
    public var abs: Double {
        ISO_9899.Math.fabs(self.value)
    }

    @_transparent
    public func hypot(_ y: Double) -> Double {
        ISO_9899.Math.hypot(self.value, y)
    }

    @_transparent
    public var cbrt: Double {
        ISO_9899.Math.cbrt(self.value)
    }
}

extension Double.C {

    @_transparent
    public var ceil: Double {
        ISO_9899.Math.ceil(self.value)
    }

    @_transparent
    public var floor: Double {
        ISO_9899.Math.floor(self.value)
    }

    @_transparent
    public var round: Double {
        ISO_9899.Math.round(self.value)
    }

    @_transparent
    public var trunc: Double {
        ISO_9899.Math.trunc(self.value)
    }
}

extension Double.C {

    @_transparent
    public var sinh: Double {
        ISO_9899.Math.sinh(self.value)
    }

    @_transparent
    public var cosh: Double {
        ISO_9899.Math.cosh(self.value)
    }

    @_transparent
    public var tanh: Double {
        ISO_9899.Math.tanh(self.value)
    }

    @_transparent
    public var asinh: Double {
        ISO_9899.Math.asinh(self.value)
    }

    @_transparent
    public var acosh: Double {
        ISO_9899.Math.acosh(self.value)
    }

    @_transparent
    public var atanh: Double {
        ISO_9899.Math.atanh(self.value)
    }
}

extension Double.C {

    @_transparent
    public var expm1: Double {
        ISO_9899.Math.expm1(self.value)
    }

    @_transparent
    public var log1p: Double {
        ISO_9899.Math.log1p(self.value)
    }
}

extension Double.C {

    @_transparent
    public var erf: Double {
        ISO_9899.Math.erf(self.value)
    }

    @_transparent
    public var erfc: Double {
        ISO_9899.Math.erfc(self.value)
    }

    @_transparent
    public var tgamma: Double {
        ISO_9899.Math.tgamma(self.value)
    }

    @_transparent
    public var lgamma: Double {
        ISO_9899.Math.lgamma(self.value)
    }
}

extension Double.C {

    @_transparent
    public var rint: Double {
        ISO_9899.Math.rint(self.value)
    }

    @_transparent
    public var nearbyint: Double {
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

extension Double.C {

    @_transparent
    public func mod(_ y: Double) -> Double {
        ISO_9899.Math.fmod(self.value, y)
    }

    @_transparent
    public func remainder(_ y: Double) -> Double {
        ISO_9899.Math.remainder(self.value, y)
    }

    @_transparent
    public func remquo(_ y: Double, _ quo: UnsafeMutablePointer<Int32>) -> Double {
        unsafe ISO_9899.Math.remquo(self.value, y, quo)
    }
}

extension Double.C {

    @_transparent
    public static func nan(_ tag: String = "") -> Double {
        tag.withCString { unsafe ISO_9899.Math.nan($0) }
    }

    @_transparent
    public func withSign(of other: Double) -> Double {
        ISO_9899.Math.copysign(self.value, other)
    }

    @_transparent
    public func nextRepresentable(toward other: Double) -> Double {
        ISO_9899.Math.nextafter(self.value, other)
    }

    @_transparent
    public func nextRepresentableExtended(toward other: Double) -> Double {
        ISO_9899.Math.nexttoward(self.value, other)
    }
}

extension Double.C {

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

extension Double.C {

    @_transparent
    public func isGreater(than other: Double) -> Bool {
        ISO_9899.Math.isgreater(self.value, other)
    }

    @_transparent
    public func isGreaterOrEqual(to other: Double) -> Bool {
        ISO_9899.Math.isgreaterequal(self.value, other)
    }

    @_transparent
    public func isLess(than other: Double) -> Bool {
        ISO_9899.Math.isless(self.value, other)
    }

    @_transparent
    public func isLessOrEqual(to other: Double) -> Bool {
        ISO_9899.Math.islessequal(self.value, other)
    }

    @_transparent
    public func isNotEqual(to other: Double) -> Bool {
        ISO_9899.Math.islessgreater(self.value, other)
    }

    @_transparent
    public func isUnordered(with other: Double) -> Bool {
        ISO_9899.Math.isunordered(self.value, other)
    }
}

extension Double.C {

    @_transparent
    public func positiveDifference(from y: Double) -> Double {
        ISO_9899.Math.fdim(self.value, y)
    }

    @_transparent
    public func max(_ y: Double) -> Double {
        ISO_9899.Math.fmax(self.value, y)
    }

    @_transparent
    public func min(_ y: Double) -> Double {
        ISO_9899.Math.fmin(self.value, y)
    }

    @_transparent
    public func fma(_ y: Double, _ z: Double) -> Double {
        ISO_9899.Math.fma(self.value, y, z)
    }
}
