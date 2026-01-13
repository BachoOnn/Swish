// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "FirebaseService",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "FirebaseService",
            targets: ["FirebaseService"]
        ),
    ],
    dependencies: [
        .package(path: "../../Domain/AuthDomain"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.0.0"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "FirebaseService",
            dependencies: [
                "AuthDomain",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
            ]
        ),
    ]
)
