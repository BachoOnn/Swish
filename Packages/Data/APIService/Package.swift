// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "APIService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "APIService",
            targets: ["APIService"]),
    ],
    targets: [
        .target(
            name: "APIService"),
    ]
)
