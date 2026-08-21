public import Error_Primitives

extension ISO_9899.Errno.Code {

    @inlinable
    public var platformCode: Error_Primitives.Error.Code {
        .posix(rawValue)
    }
}

extension ISO_9899.Errno.Code {

    @inlinable
    public init?(_ code: Error_Primitives.Error.Code) {
        guard let posix = code.posix else { return nil }
        self.init(rawValue: posix)
    }

    @inlinable
    public init(posix code: Error_Primitives.Error.Code) {
        precondition(code.isPosix, "Expected POSIX error code, got Windows error")
        self.init(rawValue: code.posix!)
    }
}

extension ISO_9899.Errno {

    public typealias PlatformCode = Error_Primitives.Error.Code
}
