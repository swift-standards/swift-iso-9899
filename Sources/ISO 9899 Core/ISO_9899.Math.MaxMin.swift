public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func fdim(_ x: Double, _ y: Double) -> Double {
        return iso9899_fdim(x, y)
    }

    @inline(always)
    public static func fdim(_ x: Float, _ y: Float) -> Float {
        return iso9899_fdimf(x, y)
    }

    @inline(always)
    public static func fmax(_ x: Double, _ y: Double) -> Double {
        return iso9899_fmax(x, y)
    }

    @inline(always)
    public static func fmax(_ x: Float, _ y: Float) -> Float {
        return iso9899_fmaxf(x, y)
    }

    @inline(always)
    public static func fmin(_ x: Double, _ y: Double) -> Double {
        return iso9899_fmin(x, y)
    }

    @inline(always)
    public static func fmin(_ x: Float, _ y: Float) -> Float {
        return iso9899_fminf(x, y)
    }

    @inline(always)
    public static func fma(_ x: Double, _ y: Double, _ z: Double) -> Double {
        return iso9899_fma(x, y, z)
    }

    @inline(always)
    public static func fma(_ x: Float, _ y: Float, _ z: Float) -> Float {
        return iso9899_fmaf(x, y, z)
    }
}
