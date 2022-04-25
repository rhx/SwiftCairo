#!/bin/sh
#
# Remove Packages directory and generated files
#
. ./config.sh
./clean.sh
exec rm -rf Package.resolved Package.pins Packages docs .docs.old Sources/${Mod}/${module}.swift Sources/${Mod}/Swift${Mod}.swift ${Mod}.xcodeproj .swiftpm $BUILD_DIR
