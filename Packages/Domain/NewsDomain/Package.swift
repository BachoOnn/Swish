// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "NewsDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "NewsDomain",
            targets: ["NewsDomain"]
        ),
    ],
    targets: [
        .target(
            name: "NewsDomain"
        ),

    ]
)
