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
        .package(path: "../../Domain/NewsDomain"),
        .package(path: "../../Domain/TeamDomain"),
        .package(path: "../../Domain/PlayerDomain"),
        .package(path: "../../Core/Helpers"),
        .package(path: "../../Config/Config"),
        .package(url: "https://github.com/BachoOnn/MyNetworkManager.git", from: "1.1.4")

    ],
    targets: [
        .target(
            name: "APIService",
            dependencies: [
                "GameDomain",
                "NewsDomain",
                "TeamDomain",
                "PlayerDomain",
                "Helpers",
                "Config",
                .product(name: "MyNetworkManager", package: "MyNetworkManager")
            ]
        ),
    ]
)
