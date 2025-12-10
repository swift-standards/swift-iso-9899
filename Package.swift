// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "swift-iso-9899",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "ISO 9899",
            targets: ["ISO 9899"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.1.0")
    ],
    targets: [
        // C module wrapping platform math library
        .target(
            name: "CISO9899Math",
            dependencies: [],
            publicHeadersPath: "include"
        ),

        // Swift interface to ISO 9899 mathematical functions
        .target(
            name: "ISO 9899",
            dependencies: ["CISO9899Math"]
        ),

        // Tests
        .testTarget(
            name: "ISO 9899 Tests",
            dependencies: [
                "ISO 9899",
                .product(name: "StandardsTestSupport", package: "swift-standards"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
