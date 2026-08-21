public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func fmod(_ x: Double, _ y: Double) -> Double {
        return iso9899_fmod(x, y)
    }

    @inline(always)
    public static func fmod(_ x: Float, _ y: Float) -> Float {
        return iso9899_fmodf(x, y)
    }

    @inline(always)
    public static func remainder(_ x: Double, _ y: Double) -> Double {
        return iso9899_remainder(x, y)
    }

    @inline(always)
    public static func remainder(_ x: Float, _ y: Float) -> Float {
        return iso9899_remainderf(x, y)
    }

    @inline(always)
    public static func remquo(
        _ x: Double,
        _ y: Double,
        _ quo: UnsafeMutablePointer<Int32>
    ) -> Double {
        return unsafe iso9899_remquo(x, y, quo)
    }

    @inline(always)
    public static func remquo(_ x: Float, _ y: Float, _ quo: UnsafeMutablePointer<Int32>) -> Float {
        return unsafe iso9899_remquof(x, y, quo)
    }
}
