// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Cairo",
    products: [ .library(name: "Cairo", targets: ["Cairo"]) ],
    dependencies: [
        .package(name: "GLibObject", url: "https://github.com/rhx/SwiftGObject.git", .branch("main"))
    ],
    targets: [
	.systemLibrary(name: "CCairo", pkgConfig: "cairo glib-2.0 gio-unix-2.0",
	    providers: [
		.brew(["cairo", "glib", "glib-networking", "gobject-introspection"]),
		.apt(["libcairo2-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
	    ]),
        .target(name: "Cairo", dependencies: ["CCairo", "GLibObject"]),
        .testTarget(name: "CairoTests", dependencies: ["Cairo"]),
    ]
)
