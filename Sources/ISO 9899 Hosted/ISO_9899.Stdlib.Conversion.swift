public import ISO_9899_Stdlib_Shims

extension ISO_9899.Stdlib {

    public enum Conversion {}
}

extension ISO_9899.Stdlib.Conversion {

    @inline(always)
    public static func toDouble(_ string: UnsafePointer<CChar>) -> Double {
        unsafe iso9899_atof(string)
    }

    @inline(always)
    public static func toInt(_ string: UnsafePointer<CChar>) -> Int32 {
        unsafe iso9899_atoi(string)
    }

    @inline(always)
    public static func toLong(_ string: UnsafePointer<CChar>) -> Int {

        unsafe iso9899_atol(string)
    }

    @inline(always)
    public static func toLongLong(_ string: UnsafePointer<CChar>) -> Int64 {
        unsafe iso9899_atoll(string)
    }
}

extension ISO_9899.Stdlib.Conversion {

    @inline(always)
    public static func parseDouble(
        _ string: UnsafePointer<CChar>
    ) -> (value: Double, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtod(string, &end)
        return unsafe (value, end)
    }

    @inline(always)
    public static func parseFloat(
        _ string: UnsafePointer<CChar>
    ) -> (value: Float, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtof(string, &end)
        return unsafe (value, end)
    }

    @inline(always)
    public static func parseLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: Int, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?

        let value = unsafe iso9899_strtol(string, &end, base)
        return unsafe (value, end)
    }

    @inline(always)
    public static func parseLongLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: Int64, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtoll(string, &end, base)
        return unsafe (value, end)
    }

    @inline(always)
    public static func parseUnsignedLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: UInt, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?

        let value = unsafe iso9899_strtoul(string, &end, base)
        return unsafe (value, end)
    }

    @inline(always)
    public static func parseUnsignedLongLong(
        _ string: UnsafePointer<CChar>,
        base: Int32 = 10
    ) -> (value: UInt64, end: UnsafeMutablePointer<CChar>?) {
        var end: UnsafeMutablePointer<CChar>?
        let value = unsafe iso9899_strtoull(string, &end, base)
        return unsafe (value, end)
    }
}
