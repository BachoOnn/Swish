// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "PlayerDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PlayerDomain",
            targets: ["PlayerDomain"]
        ),
    ],
    targets: [
        .target(
            name: "PlayerDomain"
        ),
    ]
)
