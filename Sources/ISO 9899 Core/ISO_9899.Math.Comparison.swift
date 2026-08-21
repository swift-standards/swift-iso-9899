public import ISO_9899_Math_Shims

extension ISO_9899.Math {

    @inline(always)
    public static func isgreater(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isgreater_d(x, y) != 0
    }

    @inline(always)
    public static func isgreater(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isgreater_f(x, y) != 0
    }

    @inline(always)
    public static func isgreaterequal(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isgreaterequal_d(x, y) != 0
    }

    @inline(always)
    public static func isgreaterequal(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isgreaterequal_f(x, y) != 0
    }

    @inline(always)
    public static func isless(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isless_d(x, y) != 0
    }

    @inline(always)
    public static func isless(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isless_f(x, y) != 0
    }

    @inline(always)
    public static func islessequal(_ x: Double, _ y: Double) -> Bool {
        return iso9899_islessequal_d(x, y) != 0
    }

    @inline(always)
    public static func islessequal(_ x: Float, _ y: Float) -> Bool {
        return iso9899_islessequal_f(x, y) != 0
    }

    @inline(always)
    public static func islessgreater(_ x: Double, _ y: Double) -> Bool {
        return iso9899_islessgreater_d(x, y) != 0
    }

    @inline(always)
    public static func islessgreater(_ x: Float, _ y: Float) -> Bool {
        return iso9899_islessgreater_f(x, y) != 0
    }

    @inline(always)
    public static func isunordered(_ x: Double, _ y: Double) -> Bool {
        return iso9899_isunordered_d(x, y) != 0
    }

    @inline(always)
    public static func isunordered(_ x: Float, _ y: Float) -> Bool {
        return iso9899_isunordered_f(x, y) != 0
    }
}
