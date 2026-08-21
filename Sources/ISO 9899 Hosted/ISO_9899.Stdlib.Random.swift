public import ISO_9899_Stdlib_Shims

extension ISO_9899.Stdlib {

    public enum Random {}
}

extension ISO_9899.Stdlib.Random {

    @inline(always)
    public static func seed(_ seed: UInt32) {
        iso9899_srand(seed)
    }

    @inline(always)
    public static func next() -> Int32 {
        iso9899_rand()
    }
}
