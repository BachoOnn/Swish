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
    dependencies: [
        .package(path: "../../Domain/GameDomain"),
        .package(path: "../../Core/Helpers"),
        .package(path: "../../Config/Config")
    ],
    targets: [
        .target(
            name: "APIService",
            dependencies: [
                "GameDomain",
                "Helpers",
                "Config"
            ]
        ),
    ]
)
