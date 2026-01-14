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
        .package(path: "../../Domain/AuthDomain")
    ],
    targets: [
        .target(
            name: "PersistanceService",
            dependencies: [
                "AuthDomain"
            ]
        ),
        
    ]
)
