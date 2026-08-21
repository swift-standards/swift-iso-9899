public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func erf(_ x: Double) -> Double {
        return iso9899_erf(x)
    }

    @inline(always)
    public static func erf(_ x: Float) -> Float {
        return iso9899_erff(x)
    }

    @inline(always)
    public static func erfc(_ x: Double) -> Double {
        return iso9899_erfc(x)
    }

    @inline(always)
    public static func erfc(_ x: Float) -> Float {
        return iso9899_erfcf(x)
    }

    @inline(always)
    public static func tgamma(_ x: Double) -> Double {
        return iso9899_tgamma(x)
    }

    @inline(always)
    public static func tgamma(_ x: Float) -> Float {
        return iso9899_tgammaf(x)
    }

    @inline(always)
    public static func lgamma(_ x: Double) -> Double {
        return iso9899_lgamma(x)
    }

    @inline(always)
    public static func lgamma(_ x: Float) -> Float {
        return iso9899_lgammaf(x)
    }
}
