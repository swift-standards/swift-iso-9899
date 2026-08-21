public import ISO_9899_String_Shims

extension ISO_9899.String {

    public enum Comparison {}
}

extension ISO_9899.String.Comparison {

    @inline(always)
    public static func compare(
        _ lhs: UnsafePointer<ISO_9899.String.Char>,
        _ rhs: UnsafePointer<ISO_9899.String.Char>
    ) -> ISO_9899.String.Order {
        unsafe ISO_9899.String.Order(cResult: iso9899_strcmp(lhs, rhs))
    }

    @inline(always)
    public static func compare(
        _ lhs: UnsafePointer<ISO_9899.String.Char>,
        _ rhs: UnsafePointer<ISO_9899.String.Char>,
        count: Int
    ) -> ISO_9899.String.Order {
        precondition(count >= 0, "count must be non-negative")
        return unsafe ISO_9899.String.Order(cResult: iso9899_strncmp(lhs, rhs, count))
    }
}
