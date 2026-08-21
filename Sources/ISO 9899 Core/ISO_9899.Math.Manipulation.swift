public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func copysign(_ x: Double, _ y: Double) -> Double {
        return iso9899_copysign(x, y)
    }

    @inline(always)
    public static func copysign(_ x: Float, _ y: Float) -> Float {
        return iso9899_copysignf(x, y)
    }

    @inline(always)
    public static func nan(_ tag: UnsafePointer<CChar>) -> Double {
        return unsafe iso9899_nan(tag)
    }

    @inline(always)
    public static func nanf(_ tag: UnsafePointer<CChar>) -> Float {
        return unsafe iso9899_nanf(tag)
    }

    @inline(always)
    public static func nextafter(_ x: Double, _ y: Double) -> Double {
        return iso9899_nextafter(x, y)
    }

    @inline(always)
    public static func nextafter(_ x: Float, _ y: Float) -> Float {
        return iso9899_nextafterf(x, y)
    }

    @inline(always)
    public static func nexttoward(_ x: Double, _ y: Double) -> Double {
        return iso9899_nexttoward(x, y)
    }

    @inline(always)
    public static func nexttoward(_ x: Float, _ y: Double) -> Float {
        return iso9899_nexttowardf(x, y)
    }
}
