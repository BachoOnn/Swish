// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "GameDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "GameDomain",
            targets: ["GameDomain"]
        ),
    ],
    dependencies: [
        .package(path: "../../Core/Helpers"),
        .package(path: "../../Core/Common"),
    ],
    targets: [
        .target(
            name: "GameDomain",
            dependencies: [
                "Helpers",
                "Common"
            ]
        ),
    ]
)
