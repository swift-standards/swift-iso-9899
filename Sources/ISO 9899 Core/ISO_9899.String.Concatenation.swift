public import ISO_9899_String_Shims

extension ISO_9899.String {

    public enum Concatenation {}
}

extension ISO_9899.String.Concatenation {

    @inline(always)
    @discardableResult
    public static func append(
        to destination: UnsafeMutablePointer<ISO_9899.String.Char>,
        from source: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafeMutablePointer<ISO_9899.String.Char> {
        unsafe iso9899_strcat(destination, source)
    }

    @inline(always)
    @discardableResult
    public static func append(
        to destination: UnsafeMutablePointer<ISO_9899.String.Char>,
        from source: UnsafePointer<ISO_9899.String.Char>,
        count: Int
    ) -> UnsafeMutablePointer<ISO_9899.String.Char> {
        precondition(count >= 0, "count must be non-negative")
        return unsafe iso9899_strncat(destination, source, count)
    }
}
