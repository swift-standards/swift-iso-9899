public import ISO_9899_String_Shims

extension ISO_9899.String {

    public enum Memory {}
}

extension ISO_9899.String.Memory {

    @inline(always)
    public static func copy(
        to destination: UnsafeMutableRawPointer,
        from source: UnsafeRawPointer,
        count: Int
    ) {
        _ = unsafe iso9899_memcpy(destination, source, count)
    }

    @inline(always)
    public static func move(
        to destination: UnsafeMutableRawPointer,
        from source: UnsafeRawPointer,
        count: Int
    ) {
        _ = unsafe iso9899_memmove(destination, source, count)
    }
}

extension ISO_9899.String.Memory {

    @inline(always)
    public static func compare(
        _ lhs: UnsafeRawPointer,
        _ rhs: UnsafeRawPointer,
        count: Int
    ) -> Int {
        unsafe Int(iso9899_memcmp(lhs, rhs, count))
    }
}

extension ISO_9899.String.Memory {

    @inline(always)
    public static func find(
        in buffer: UnsafeRawPointer,
        byte: UInt8,
        count: Int
    ) -> UnsafeRawPointer? {
        unsafe iso9899_memchr_const(buffer, Int32(byte), count)
    }

    @inline(always)
    public static func find(
        in buffer: UnsafeMutableRawPointer,
        byte: UInt8,
        count: Int
    ) -> UnsafeMutableRawPointer? {
        unsafe iso9899_memchr(buffer, Int32(byte), count)
    }
}

extension ISO_9899.String.Memory {

    @inline(always)
    public static func fill(
        _ destination: UnsafeMutableRawPointer,
        with byte: UInt8,
        count: Int
    ) {
        _ = unsafe iso9899_memset(destination, Int32(byte), count)
    }
}
