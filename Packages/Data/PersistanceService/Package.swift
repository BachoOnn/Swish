// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "PersistanceService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PersistanceService",
            targets: ["PersistanceService"]
        ),
    ],
    
    dependencies: [
        .package(path: "../../Domain/AuthDomain"),
        .package(path: "../../Domain/TeamDomain"),
        .package(path: "../../Domain/PlayerDomain"),
        .package(path: "../../Domain/FavoritesDomain")
    ],
    targets: [
        .target(
            name: "PersistanceService",
            dependencies: [
                "AuthDomain",
                "TeamDomain",
                "PlayerDomain",
                "FavoritesDomain"
            ]
        ),
        
    ]
)
