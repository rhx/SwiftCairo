# SwiftCairo
A Swift wrapper around cairo-1.x that is largely auto-generated from gobject-introspection


## Prerequisites

### Swift

To build, you need Swift 3.1 or higher (Swift 4.x should work fine) (download from https://swift.org/download/ -- if you are using macOS, make sure you have the command line tools installed as well).  Test that your compiler works using `swift --version`, which should give you something like

	$ swift --version
	Apple Swift version 4.2 (swiftlang-1000.0.32.1 clang-1000.10.39)
	Target: x86_64-apple-darwin18.0.0

on macOS, or on Linux you should get something like:

	$ swift --version
	Swift version 4.1 (swift-4.1-RELEASE)
	Target: x86_64-unknown-linux-gnu

### GLib 2.46 and Cairo 1.14.10 or higher

These Swift wrappers have been tested with glib-2.46, 2.48, 2.52, and 2.56.1.  They should work with higher versions, but YMMV.  Also make sure you have `gobject-introspection` and its `.gir` files installed.

#### Linux

On Ubuntu 16.04 and 18.04, you can use the gtk that comes with the distribution.  Just install with the `apt` package manager:

	sudo apt update
	sudo apt install libcairo2-dev libcairo-gobject2 gobject-introspection libgirepository1.0-dev libxml2-dev

If you prefer a newer version of gtk, you can also install it from the GNOME 3 Staging PPA (see https://launchpad.net/~gnome3-team/+archive/ubuntu/gnome3-staging), but be aware that this can be a bit dangerous (as this removes packages that can be vital, particularly if you use a GNOME-based desktop), so only do this if you know what you are doing:

	sudo add-apt-repository ppa:gnome3-team/gnome3-staging
	sudo apt update
	sudo apt dist-upgrade
	sudo apt install libcairo2-dev libcairo-gobject2 gobject-introspection libgirepository1.0-dev libxml2-dev

#### macOS

On macOS, you can install glib and Cairo using HomeBrew (for setup instructions, see http://brew.sh).  Once you have a running HomeBrew installation, you can use it to install a native version of cairo:

	brew update
	brew install cairo gobject-introspection


## Building
Normally, you don't build this package directly, but you embed it into your own project (see 'Embedding' below).  However, you can build and test this module separately to ensure that everything works.  Make sure you have all the prerequisites installed (see above).  After that, you can simply clone this repository and build the command line executable (be patient, this will download all the required dependencies and take a while to compile) using

	git clone https://github.com/rhx/SwiftCairo.git
	cd SwiftCairo
	./build.sh
	./test.sh

### Xcode

On macOS, you can build the project using Xcode instead.  To do this, you need to create an Xcode project first, then open the project in the Xcode IDE:

	./xcodegen.sh
	open Cairo.xcodeproj

After that, use the (usual) Build and Test buttons to build/test this package.



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

