// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TeamDomain",
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
