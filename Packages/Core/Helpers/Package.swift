// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Helpers",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Helpers",
            targets: ["Helpers"]),
    ],
    targets: [
        .target(
            name: "Helpers"),

    ]
)
