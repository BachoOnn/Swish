// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Authorization",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Authorization",
            targets: ["Authorization"]
        ),
    ],
    dependencies: [
        .package(path: "../../Core/Common"),
        .package(path: "../../Core/Helpers"),
        .package(path: "../../Domain/AuthDomain"),
        .package(path: "../../Data/FirebaseService")
    ],
    targets: [
        .target(
            name: "Authorization",
            dependencies: [
                "Common",
                "Helpers",
                "AuthDomain",
                "FirebaseService"
            ]
        ),
    ]
)
