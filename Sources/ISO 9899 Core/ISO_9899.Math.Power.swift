public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func pow(_ x: Double, _ y: Double) -> Double {
        return iso9899_pow(x, y)
    }

    @inline(always)
    public static func pow(_ x: Float, _ y: Float) -> Float {
        return iso9899_powf(x, y)
    }

    @inline(always)
    public static func sqrt(_ x: Double) -> Double {
        return iso9899_sqrt(x)
    }

    @inline(always)
    public static func sqrt(_ x: Float) -> Float {
        return iso9899_sqrtf(x)
    }
}
