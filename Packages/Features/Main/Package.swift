// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Main",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Main",
            targets: ["Main"]
        ),
    ],
    dependencies: [
        .package(path: "../../Core/Common"),
        .package(path: "../../Core/Helpers"),
        .package(path: "../../Domain/AuthDomain"),
        .package(path: "../../Domain/GameDomain"),
        .package(path: "../../Domain/NewsDomain"),
        .package(path: "../../Domain/TeamDomain")
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: [
                "Common",
                "Helpers",
                "AuthDomain",
                "GameDomain",
                "NewsDomain",
                "TeamDomain"
            ]
        ),
    ]
)
