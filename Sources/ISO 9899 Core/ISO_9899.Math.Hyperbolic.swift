public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func sinh(_ x: Double) -> Double {
        return iso9899_sinh(x)
    }

    @inline(always)
    public static func sinh(_ x: Float) -> Float {
        return iso9899_sinhf(x)
    }

    @inline(always)
    public static func cosh(_ x: Double) -> Double {
        return iso9899_cosh(x)
    }

    @inline(always)
    public static func cosh(_ x: Float) -> Float {
        return iso9899_coshf(x)
    }

    @inline(always)
    public static func tanh(_ x: Double) -> Double {
        return iso9899_tanh(x)
    }

    @inline(always)
    public static func tanh(_ x: Float) -> Float {
        return iso9899_tanhf(x)
    }

    @inline(always)
    public static func asinh(_ x: Double) -> Double {
        return iso9899_asinh(x)
    }

    @inline(always)
    public static func asinh(_ x: Float) -> Float {
        return iso9899_asinhf(x)
    }

    @inline(always)
    public static func acosh(_ x: Double) -> Double {
        return iso9899_acosh(x)
    }

    @inline(always)
    public static func acosh(_ x: Float) -> Float {
        return iso9899_acoshf(x)
    }

    @inline(always)
    public static func atanh(_ x: Double) -> Double {
        return iso9899_atanh(x)
    }

    @inline(always)
    public static func atanh(_ x: Float) -> Float {
        return iso9899_atanhf(x)
    }
}
