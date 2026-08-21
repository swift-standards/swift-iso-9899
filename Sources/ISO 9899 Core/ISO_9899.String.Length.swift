public import ISO_9899_String_Shims

extension ISO_9899.String {

    public enum Length {}
}

extension ISO_9899.String.Length {

    @inline(always)
    public static func strlen(_ string: UnsafePointer<ISO_9899.String.Char>) -> Int {
        unsafe iso9899_strlen(string)
    }
}
