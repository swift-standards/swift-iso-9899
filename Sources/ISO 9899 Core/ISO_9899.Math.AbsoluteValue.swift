public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func fabs(_ x: Double) -> Double {
        return iso9899_fabs(x)
    }

    @inline(always)
    public static func fabs(_ x: Float) -> Float {
        return iso9899_fabsf(x)
    }

    @inline(always)
    public static func hypot(_ x: Double, _ y: Double) -> Double {
        return iso9899_hypot(x, y)
    }

    @inline(always)
    public static func hypot(_ x: Float, _ y: Float) -> Float {
        return iso9899_hypotf(x, y)
    }

    @inline(always)
    public static func cbrt(_ x: Double) -> Double {
        return iso9899_cbrt(x)
    }

    @inline(always)
    public static func cbrt(_ x: Float) -> Float {
        return iso9899_cbrtf(x)
    }
}
