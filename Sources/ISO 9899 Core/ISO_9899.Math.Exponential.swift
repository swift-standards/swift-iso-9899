public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func exp(_ x: Double) -> Double {
        return iso9899_exp(x)
    }

    @inline(always)
    public static func exp(_ x: Float) -> Float {
        return iso9899_expf(x)
    }

    @inline(always)
    public static func exp2(_ x: Double) -> Double {
        return iso9899_exp2(x)
    }

    @inline(always)
    public static func exp2(_ x: Float) -> Float {
        return iso9899_exp2f(x)
    }

    @inline(always)
    public static func log(_ x: Double) -> Double {
        return iso9899_log(x)
    }

    @inline(always)
    public static func log(_ x: Float) -> Float {
        return iso9899_logf(x)
    }

    @inline(always)
    public static func log2(_ x: Double) -> Double {
        return iso9899_log2(x)
    }

    @inline(always)
    public static func log2(_ x: Float) -> Float {
        return iso9899_log2f(x)
    }

    @inline(always)
    public static func log10(_ x: Double) -> Double {
        return iso9899_log10(x)
    }

    @inline(always)
    public static func log10(_ x: Float) -> Float {
        return iso9899_log10f(x)
    }

    @inline(always)
    public static func expm1(_ x: Double) -> Double {
        return iso9899_expm1(x)
    }

    @inline(always)
    public static func expm1(_ x: Float) -> Float {
        return iso9899_expm1f(x)
    }

    @inline(always)
    public static func log1p(_ x: Double) -> Double {
        return iso9899_log1p(x)
    }

    @inline(always)
    public static func log1p(_ x: Float) -> Float {
        return iso9899_log1pf(x)
    }
}
