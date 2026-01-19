// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TeamDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "TeamDomain",
            targets: ["TeamDomain"]
        ),
    ],
    targets: [
        .target(
            name: "TeamDomain"
        ),
    ]
)
