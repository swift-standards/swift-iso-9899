public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func sin(_ x: Double) -> Double {
        return iso9899_sin(x)
    }

    @inline(always)
    public static func sin(_ x: Float) -> Float {
        return iso9899_sinf(x)
    }

    @inline(always)
    public static func cos(_ x: Double) -> Double {
        return iso9899_cos(x)
    }

    @inline(always)
    public static func cos(_ x: Float) -> Float {
        return iso9899_cosf(x)
    }

    @inline(always)
    public static func tan(_ x: Double) -> Double {
        return iso9899_tan(x)
    }

    @inline(always)
    public static func tan(_ x: Float) -> Float {
        return iso9899_tanf(x)
    }

    @inline(always)
    public static func asin(_ x: Double) -> Double {
        return iso9899_asin(x)
    }

    @inline(always)
    public static func asin(_ x: Float) -> Float {
        return iso9899_asinf(x)
    }

    @inline(always)
    public static func acos(_ x: Double) -> Double {
        return iso9899_acos(x)
    }

    @inline(always)
    public static func acos(_ x: Float) -> Float {
        return iso9899_acosf(x)
    }

    @inline(always)
    public static func atan(_ x: Double) -> Double {
        return iso9899_atan(x)
    }

    @inline(always)
    public static func atan(_ x: Float) -> Float {
        return iso9899_atanf(x)
    }

    @inline(always)
    public static func atan2(_ y: Double, _ x: Double) -> Double {
        return iso9899_atan2(y, x)
    }

    @inline(always)
    public static func atan2(_ y: Float, _ x: Float) -> Float {
        return iso9899_atan2f(y, x)
    }
}
