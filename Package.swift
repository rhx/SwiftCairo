// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Cairo",
    products: [ .library(name: "Cairo", targets: ["Cairo"]) ],
    dependencies: [
        .package(url: "https://github.com/rhx/gir2swift.git",    branch: "main"),
        .package(url: "https://github.com/rhx/SwiftGModule.git", branch: "main"),
        .package(url: "https://github.com/rhx/SwiftGIO.git",     branch: "main"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
	.systemLibrary(name: "CCairo", pkgConfig: "cairo",
	    providers: [
		.brew(["cairo", "glib", "glib-networking", "gobject-introspection"]),
		.apt(["libcairo2-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
	    ]),
        .target(
            name: "Cairo", 
            dependencies: [
                "CCairo",
                .product(name: "gir2swift", package: "gir2swift"),
                .product(name: "GModule",   package: "SwiftGModule"),
                .product(name: "GIO",       package: "SwiftGIO")
            ],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"], .when(configuration: .release)),
                .unsafeFlags(["-suppress-warnings", "-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug)),
            ],
            plugins: [
                .plugin(name: "gir2swift-plugin", package: "gir2swift")
            ]
        ),
        .testTarget(name: "CairoTests", dependencies: ["Cairo"]),
    ]
)
