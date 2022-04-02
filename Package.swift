// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Cairo",
    products: [ .library(name: "Cairo", targets: ["Cairo"]) ],
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/rhx/gir2swift.git", .branch("swift52")),
        .package(name: "GLibObject", url: "https://github.com/rhx/SwiftGObject.git", .branch("swift52"))
    ],
    targets: [
	.systemLibrary(name: "CCairo", pkgConfig: "cairo",
	    providers: [
		.brew(["cairo", "glib", "glib-networking", "gobject-introspection"]),
		.apt(["libcairo2-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
	    ]),
        .target(
            name: "Cairo", 
            dependencies: ["CCairo", "GLibObject"],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug))]
        ),
        .testTarget(name: "CairoTests", dependencies: ["Cairo"]),
    ]
)
