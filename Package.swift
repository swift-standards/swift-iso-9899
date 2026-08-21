// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-iso-9899",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        // Core: errno, string memory ops, math - minimal libc surface
        .library(
            name: "ISO 9899 Core",
            targets: ["ISO 9899 Core"]
        ),
        // Full: Core + ctype, stdlib allocation/environment
        .library(
            name: "ISO 9899",
            targets: ["ISO 9899"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-error-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-ownership-primitives.git",
            branch: "main"
        ),
    ],
    targets: [
        // MARK: - C Shim Modules (Core)

        .target(
            name: "ISO 9899 Math Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "ISO 9899 Errno Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "ISO 9899 String Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),

        // MARK: - C Shim Modules (Hosted)

        .target(
            name: "ISO 9899 Ctype Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "ISO 9899 Stdlib Shims",
            dependencies: [],
            publicHeadersPath: "include"
        ),

        // MARK: - Swift Targets

        // Core: errno, string memory ops, math
        // Suitable for minimal/embedded-like environments with OS libc
        .target(
            name: "ISO 9899 Core",
            dependencies: [
                "ISO 9899 Math Shims",
                "ISO 9899 Errno Shims",
                "ISO 9899 String Shims",
                .product(name: "Error Primitives", package: "swift-error-primitives"),
                .product(name: "Ownership Primitives", package: "swift-ownership-primitives"),
            ],
            path: "Sources/ISO 9899 Core",
            swiftSettings: [
                .enableExperimentalFeature("Lifetimes")
            ]
        ),

        // Hosted: Core + ctype, stdlib (allocation, environment)
        // Requires full hosted OS environment
        .target(
            name: "ISO 9899 Hosted",
            dependencies: [
                "ISO 9899 Core",
                "ISO 9899 Ctype Shims",
                "ISO 9899 Stdlib Shims",
            ],
            path: "Sources/ISO 9899 Hosted",
            swiftSettings: [
                .enableExperimentalFeature("Lifetimes")
            ]
        ),

        // Umbrella: Re-exports everything
        .target(
            name: "ISO 9899",
            dependencies: ["ISO 9899 Hosted"],
            path: "Sources/ISO 9899"
        ),

        // MARK: - Tests
        .testTarget(
            name: "ISO 9899 Tests",
            dependencies: [
                "ISO 9899"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
