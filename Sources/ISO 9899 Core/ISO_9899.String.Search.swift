public import ISO_9899_String_Shims

extension ISO_9899.String {

    public enum Search {}
}

extension ISO_9899.String.Search {

    @inline(always)
    public static func character(
        in string: UnsafePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strchr_const(string, Int32(byte))
    }

    @inline(always)
    public static func character(
        in string: UnsafeMutablePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strchr(string, Int32(byte))
    }
}

extension ISO_9899.String.Search {

    @inline(always)
    public static func lastCharacter(
        in string: UnsafePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strrchr_const(string, Int32(byte))
    }

    @inline(always)
    public static func lastCharacter(
        in string: UnsafeMutablePointer<ISO_9899.String.Char>,
        byte: ISO_9899.String.Char
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strrchr(string, Int32(byte))
    }
}

extension ISO_9899.String.Search {

    @inline(always)
    public static func substring(
        in haystack: UnsafePointer<ISO_9899.String.Char>,
        find needle: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strstr_const(haystack, needle)
    }

    @inline(always)
    public static func substring(
        in haystack: UnsafeMutablePointer<ISO_9899.String.Char>,
        find needle: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strstr(haystack, needle)
    }
}

extension ISO_9899.String.Search {

    @inline(always)
    public static func anyCharacter(
        in string: UnsafePointer<ISO_9899.String.Char>,
        from accept: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strpbrk_const(string, accept)
    }

    @inline(always)
    public static func anyCharacter(
        in string: UnsafeMutablePointer<ISO_9899.String.Char>,
        from accept: UnsafePointer<ISO_9899.String.Char>
    ) -> UnsafeMutablePointer<ISO_9899.String.Char>? {
        unsafe iso9899_strpbrk(string, accept)
    }
}

extension ISO_9899.String.Search {

    @inline(always)
    public static func span(
        in string: UnsafePointer<ISO_9899.String.Char>,
        accept: UnsafePointer<ISO_9899.String.Char>
    ) -> Int {
        unsafe iso9899_strspn(string, accept)
    }

    @inline(always)
    public static func complementSpan(
        in string: UnsafePointer<ISO_9899.String.Char>,
        reject: UnsafePointer<ISO_9899.String.Char>
    ) -> Int {
        unsafe iso9899_strcspn(string, reject)
    }
}
