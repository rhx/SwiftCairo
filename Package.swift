// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Cairo",
    products: [ .library(name: "Cairo", targets: ["Cairo"]) ],
    dependencies: [
        .package(url: "https://github.com/rhx/gir2swift.git",    branch: "development"),
        .package(url: "https://github.com/rhx/SwiftGObject.git", branch: "development")
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
                .product(name: "GLibObject", package: "SwiftGObject")
            ],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug))],
            plugins: [
                .plugin(name: "gir2swift-plugin", package: "gir2swift")
            ]
        ),
        .testTarget(name: "CairoTests", dependencies: ["Cairo"]),
    ]
)
