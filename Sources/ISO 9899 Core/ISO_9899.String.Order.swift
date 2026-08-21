extension ISO_9899.String {

    public enum Order: Int, Sendable {

        case less = -1

        case equal = 0

        case greater = 1
    }
}

extension ISO_9899.String.Order {

    @inline(always)
    public init(cResult: Int32) {
        if cResult < 0 {
            self = .less
        } else if cResult > 0 {
            self = .greater
        } else {
            self = .equal
        }
    }
}
