public import ISO_9899_Stdlib_Shims

extension ISO_9899.Stdlib {

    public enum Environment {}
}

extension ISO_9899.Stdlib.Environment {

    @inline(always)
    public static func get(
        _ name: UnsafePointer<CChar>
    ) -> UnsafePointer<CChar>? {
        unsafe iso9899_getenv(name).map { unsafe UnsafePointer($0) }
    }
}
