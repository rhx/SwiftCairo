#!/bin/sh
#
# Remove Packages directory and generated files
#
. ./config.sh
./clean.sh
exec rm -rf Packages Sources/${Module}.swift Sources/Swift${Mod}.swift ${Mod}.xcodeproj
