# SwiftCairo
A Swift wrapper around cairo-1.x that is largely auto-generated from gobject-introspection.
For up to date (auto-generated) reference documentation, see https://rhx.github.io/SwiftCairo/

![macOS 11 build](https://github.com/rhx/SwiftCairo/workflows/macOS%2011/badge.svg)
![macOS 10.15 build](https://github.com/rhx/SwiftCairo/workflows/macOS%2010.15/badge.svg)
![Ubuntu 20.04 build](https://github.com/rhx/SwiftCairo/workflows/Ubuntu%2020.04/badge.svg)
![Ubuntu 18.04 build](https://github.com/rhx/SwiftCairo/workflows/Ubuntu%2018.04/badge.svg)

## What is new?

Version 12 of gir2swift pulls in [PR#10](https://github.com/rhx/gir2swift/pull/10), addressing several issues:

- Improvements to the Build experience and LSP [rhx/SwiftGtk#34](https://github.com/rhx/SwiftGtk/issues/34)
- Fix issues with LLDB [rhx/SwiftGtk#39](https://github.com/rhx/SwiftGtk/issues/39)
- **Controversial:** Implicitly marks all declarations named "priv" as if they had attribute `private=1`
- Prevents all "Private" records from generating unless generated in their instance record
  - `-a` option generates all records
- Introduces CI
- For Class metadata types no longer generates class wrappers. Ref structs now contain static method which returnes the GType of the class and instance of the Class metatype wrapped in the Ref struct.
- Adds final class GWeak<T> where T could be any Ref struct of a type which supports ARC. This class is a property wrapper which contains weak reference to any instance of T. This is especially beneficial for capture lists.
- Adds support for weak observation.
- Constructors and factories of GObjectInitiallyUnowned classes now consume floating reference upon initialisation as advised by [the GObject documentation](https://developer.gnome.org/gobject/stable/gobject-The-Base-Object-Type.html)

Partially implemented:
- Typed signal generation. Issues shown in [rhx/SwiftGtk#35](https://github.com/rhx/SwiftGtk/issues/35) hat remain to be addressed are listed here: [mikolasstuchlik/gir2swift#2](https://github.com/mikolasstuchlik/gir2swift/pull/2).

### Other notable changes

Version 11 introduces a new type system into `gir2swift`,
to ensure it has a representation of the underlying types.
This is necessary for Swift 5.3 onwards, which requires more stringent casts.
As a consequence, accessors can accept and return idiomatic Swift rather than
underlying types or pointers.
This means that a lot of the changes will be source-breaking for code that
was compiled against libraries built with earlier versions of `gir2swift`.

 * Requires Swift 5.2 or later
 * Wrapper code is now `@inlinable` to enable the compiler to optimise away most of the wrappers
 * Parameters and return types use more idiomatic Swift (e.g. `Ref` wrappers instead of pointers, `Int` instead of `gint`, etc.)
 * Functions that take or return records now are templated instead of using the type-erased Protocol
 * `ErrorType` has been renamed `GLibError` to ensure it neither clashes with `Swift.Error` nor the `GLib.ErrorType`  scanner enum
 * Parameters or return types for records/classes now use the corresponding, lightweight Swift `Ref` wrapper instead of the underlying pointer


## Prerequisites

### Swift

To build, you need at least Swift 5.2 (Swift 5.3+ should work fine), download from https://swift.org/download/ -- if you are using macOS, make sure you have the command line tools installed as well).  Test that your compiler works using `swift --version`, which should give you something like

	$ swift --version
	Apple Swift version 5.3.2 (swiftlang-1200.0.45 clang-1200.0.32.28)
    Target: x86_64-apple-darwin20.3.0

on macOS, or on Linux you should get something like:

	$ swift --version
	Swift version 5.3.2 (swift-5.3.2-RELEASE)
	Target: x86_64-unknown-linux-gnu

### GLib 2.46 and Cairo 1.14.10 or higher

These Swift wrappers have been tested with glib-2.46, 2.48, 2.52, 2.56, 2.58, 2.60, 2.62, 2.64, and 2.66.  They should work with higher versions, but YMMV.  Also make sure you have `gobject-introspection` and its `.gir` files installed.

#### Linux

##### Ubuntu

On Ubuntu 16.04 and 18.04, you can use the gtk that comes with the distribution.  Just install with the `apt` package manager:

	sudo apt update
	sudo apt install libcairo2-dev libcairo-gobject2 gobject-introspection libgirepository1.0-dev libxml2-dev

If you prefer a newer version of gtk, you can also install it from the GNOME 3 Staging PPA (see https://launchpad.net/~gnome3-team/+archive/ubuntu/gnome3-staging), but be aware that this can be a bit dangerous (as this removes packages that can be vital, particularly if you use a GNOME-based desktop), so only do this if you know what you are doing:

	sudo add-apt-repository ppa:gnome3-team/gnome3-staging
	sudo apt update
	sudo apt dist-upgrade
	sudo apt install libcairo2-dev libcairo-gobject2 gobject-introspection libgirepository1.0-dev libxml2-dev

##### Fedora

On Fedora 29, you can use the gtk that comes with the distribution.  Just install with the `dnf` package manager:

	sudo dnf install cairo-devel cairo-gobject-devel glib2-devel gobject-introspection-devel libxml2-devel

#### macOS

On macOS, you can install glib and Cairo using HomeBrew (for setup instructions, see http://brew.sh).  Once you have a running HomeBrew installation, you can use it to install a native version of cairo:

	brew update
	brew install cairo glib glib-networking gobject-introspection pkg-config


## Usage

Normally, you don't build this package directly (but for testing you can - see 'Building' below). Instead you need to embed SwiftCairo into your own project using the [Swift Package Manager](https://swift.org/package-manager/).  After installing the prerequisites (see 'Prerequisites' below), add `SwiftCairo` as a dependency to your `Package.swift` file, e.g.:

```Swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(name: "MyPackage",
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/rhx/gir2swift.git", .branch("main")),
        .package(name: "Cairo", url: "https://github.com/rhx/SwiftCairo.git", .branch("main")),
    ],
    targets: [.target(name: "MyPackage", dependencies: ["Cairo"])]
)
```

## Building

Normally, you don't build this package directly, but you embed it into your own project (see 'Usage' above).  However, you can build and test this module separately to ensure that everything works.  Make sure you have all the prerequisites installed (see above).  After that, you can simply clone this repository and build the command line executable (be patient, this will download all the required dependencies and take a while to compile) using

	git clone https://github.com/rhx/SwiftCairo.git
	cd SwiftCairo
    ./run-gir2swift.sh
    swift build
    swift test

Please note that on macOS, due to a bug currently in the Swift Package Manager,
you need to pass in the build flags manually, i.e. instead of `swift build` and `swift test` you can run

    swift build `./run-gir2swift.sh flags -noUpdate`
    swift test  `./run-gir2swift.sh flags -noUpdate`

### Xcode

On macOS, you can build the project using Xcode instead.  To do this, you need to create an Xcode project first, then open the project in the Xcode IDE:

	./xcodegen.sh
	open Cairo.xcodeproj

After that, use the (usual) Build and Test buttons to build/test this package.



## Documentation
You can find reference documentation inside the [docs](https://rhx.github.io/SwiftCairo/) folder.
This was generated using the [jazzy](https://github.com/realm/jazzy) tool.
If you want to generate your own documentation, matching your local installation,
you can use the `generate-documentation.sh` script in the repository.
Unfortunately, at this stage [jazzy](https://github.com/realm/jazzy) only works on macOS (and crashes under Linux), so this will currently only work on a Mac.



## Troubleshooting
Here are some common errors you might encounter and how to fix them.

### Old Swift toolchain or Xcode
If you get an error such as

	$ ./build.sh 
	error: unable to invoke subcommand: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-package (No such file or directory)
	
this probably means that your Swift toolchain is too old.  Make sure the latest toolchain is the one that is found when you run the Swift compiler (see above).

  If you get an older version, make sure that the right version of the swift compiler is found first in your `PATH`.  On macOS, use xcode-select to select and install the latest version, e.g.:

	sudo xcode-select -s /Applications/Xcode.app
	xcode-select --install

### Known Issues

 * When building, a lot of warnings appear.  This is largely an issue with automatic `RawRepresentable` conformance in the Swift Standard library.  As a workaround, you can turn this off by passing the `-Xswiftc -suppress-warnings` parameter when building.
 
 * The current build system does not support directory paths with spaces (e.g. the `My Drive` directory used by Google Drive File Stream).
 * BUILD_DIR is not supported in the current build system.
 
As a workaround, you can use the old build scripts, e.g. `./build.sh` (instead of `run-gir2swift.sh` and `swift build`) to build a package.
