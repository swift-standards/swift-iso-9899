public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inlinable
    public static func ceil(_ x: Double) -> Double {
        iso9899_ceil(x)
    }

    @inlinable
    public static func ceil(_ x: Float) -> Float {
        iso9899_ceilf(x)
    }

    @inlinable
    public static func floor(_ x: Double) -> Double {
        iso9899_floor(x)
    }

    @inlinable
    public static func floor(_ x: Float) -> Float {
        iso9899_floorf(x)
    }

    @inlinable
    public static func round(_ x: Double) -> Double {
        iso9899_round(x)
    }

    @inlinable
    public static func round(_ x: Float) -> Float {
        iso9899_roundf(x)
    }

    @inlinable
    public static func trunc(_ x: Double) -> Double {
        iso9899_trunc(x)
    }

    @inlinable
    public static func trunc(_ x: Float) -> Float {
        iso9899_truncf(x)
    }
}
