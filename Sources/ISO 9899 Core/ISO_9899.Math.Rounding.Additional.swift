public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func rint(_ x: Double) -> Double {
        return iso9899_rint(x)
    }

    @inline(always)
    public static func rint(_ x: Float) -> Float {
        return iso9899_rintf(x)
    }

    @inline(always)
    public static func nearbyint(_ x: Double) -> Double {
        return iso9899_nearbyint(x)
    }

    @inline(always)
    public static func nearbyint(_ x: Float) -> Float {
        return iso9899_nearbyintf(x)
    }

    @inline(always)
    public static func lrint(_ x: Double) -> Int {
        return Int(iso9899_lrint(x))
    }

    @inline(always)
    public static func lrint(_ x: Float) -> Int {
        return Int(iso9899_lrintf(x))
    }

    @inline(always)
    public static func llrint(_ x: Double) -> Int64 {
        return iso9899_llrint(x)
    }

    @inline(always)
    public static func llrint(_ x: Float) -> Int64 {
        return iso9899_llrintf(x)
    }

    @inline(always)
    public static func lround(_ x: Double) -> Int {
        return Int(iso9899_lround(x))
    }

    @inline(always)
    public static func lround(_ x: Float) -> Int {
        return Int(iso9899_lroundf(x))
    }

    @inline(always)
    public static func llround(_ x: Double) -> Int64 {
        return iso9899_llround(x)
    }

    @inline(always)
    public static func llround(_ x: Float) -> Int64 {
        return iso9899_llroundf(x)
    }
}
