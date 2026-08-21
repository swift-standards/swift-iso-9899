public import ISO_9899_Ctype_Shims

extension ISO_9899 {

    public enum Ctype {}
}

extension ISO_9899.Ctype {

    @inline(always)
    public static func isAlphanumeric(_ c: Int32) -> Bool {
        iso9899_isalnum(c) != 0
    }

    @inline(always)
    public static func isAlpha(_ c: Int32) -> Bool {
        iso9899_isalpha(c) != 0
    }

    @inline(always)
    public static func isBlank(_ c: Int32) -> Bool {
        iso9899_isblank(c) != 0
    }

    @inline(always)
    public static func isControl(_ c: Int32) -> Bool {
        iso9899_iscntrl(c) != 0
    }

    @inline(always)
    public static func isDigit(_ c: Int32) -> Bool {
        iso9899_isdigit(c) != 0
    }

    @inline(always)
    public static func isGraph(_ c: Int32) -> Bool {
        iso9899_isgraph(c) != 0
    }

    @inline(always)
    public static func isLower(_ c: Int32) -> Bool {
        iso9899_islower(c) != 0
    }

    @inline(always)
    public static func isPrint(_ c: Int32) -> Bool {
        iso9899_isprint(c) != 0
    }

    @inline(always)
    public static func isPunctuation(_ c: Int32) -> Bool {
        iso9899_ispunct(c) != 0
    }

    @inline(always)
    public static func isSpace(_ c: Int32) -> Bool {
        iso9899_isspace(c) != 0
    }

    @inline(always)
    public static func isUpper(_ c: Int32) -> Bool {
        iso9899_isupper(c) != 0
    }

    @inline(always)
    public static func isHexDigit(_ c: Int32) -> Bool {
        iso9899_isxdigit(c) != 0
    }
}

extension ISO_9899.Ctype {

    @inline(always)
    public static func toLower(_ c: Int32) -> Int32 {
        iso9899_tolower(c)
    }

    @inline(always)
    public static func toUpper(_ c: Int32) -> Int32 {
        iso9899_toupper(c)
    }
}
