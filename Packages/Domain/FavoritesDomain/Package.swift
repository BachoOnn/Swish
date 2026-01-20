// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "FavoritesDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "FavoritesDomain",
            targets: ["FavoritesDomain"]
        ),
    ],
    dependencies: [
        .package(path: "../../Domain/TeamDomain"),
        .package(path: "../../Domain/PlayerDomain")
    ],
    targets: [
        .target(
            name: "FavoritesDomain",
            dependencies: [
                "TeamDomain",
                "PlayerDomain"
            ]
        ),
    ]
)
