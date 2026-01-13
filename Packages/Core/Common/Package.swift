// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Common",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Common",
            targets: ["Common"]),
    ],
    targets: [
        .target(
            name: "Common",
            dependencies: [],
            resources: [.process("Media.xcassets")]
        ),
    ]
)
