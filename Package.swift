// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Cairo",
    products: [
        .library(name: "Cairo", targets: ["Cairo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rhx/CCairo.git", .branch("master")),
        .package(url: "https://github.com/rhx/SwiftGObject.git", .branch("master"))
    ],
    targets: [
        .target(name: "Cairo", dependencies: ["GLibObject"]),
        .testTarget(name: "CairoTests", dependencies: ["Cairo"]),
    ]
)
