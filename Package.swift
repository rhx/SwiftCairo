import PackageDescription

let package = Package(
    name: "Cairo",
    dependencies: [
        .Package(url: "https://github.com/rhx/CCairo.git", majorVersion: 1),
        .Package(url: "https://github.com/rhx/SwiftGObject.git", majorVersion: 2),
    ]
)
