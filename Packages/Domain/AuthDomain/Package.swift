// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AuthDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "AuthDomain",
            targets: ["AuthDomain"]),
    ],
    targets: [
        .target(
            name: "AuthDomain"),
    ]
)
