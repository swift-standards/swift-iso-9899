extension ISO_9899.String.Comparison {

    @inlinable
    public static func equals(
        _ pointer: UnsafePointer<ISO_9899.String.Char>,
        _ literal: StaticString
    ) -> Bool {
        let count = literal.utf8CodeUnitCount

        return literal.withUTF8Buffer { buffer in
            for i in 0..<count {
                let byte = unsafe pointer[i]
                guard byte != ISO_9899.String.terminator,
                    unsafe (byte == buffer[i])
                else { return false }
            }
            return unsafe pointer[count] == ISO_9899.String.terminator
        }
    }
}
