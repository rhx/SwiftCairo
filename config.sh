#!/bin/sh
#
# Configuration for the module to compile, the Swift toolchain, and
# the compiler and linker flags to use.
#
Mod=Cairo
Module=${Mod}-1.0
module=`echo "${Module}" | tr '[:upper:]' '[:lower:]'`
mod=`echo "${Mod}" | tr '[:upper:]' '[:lower:]'`
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
LINKFLAGS=`pkg-config --libs $mod gobject-2.0 gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xlinker /' | tr '\n' ' '`
CCFLAGS=`pkg-config --cflags $mod gobject-2.0 gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xcc /' | tr '\n' ' ' `
