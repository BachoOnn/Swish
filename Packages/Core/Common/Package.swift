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
    
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.6.2"),

    ],
    targets: [
        .target(
            name: "Common",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            resources: [.process("Media.xcassets")]
        ),
    ]
)
