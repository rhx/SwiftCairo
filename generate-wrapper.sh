#!/bin/sh
#
# Swift code wrapper generator for gobject-introspection (.gir) files.
# This needs an installed `gir2swift' executable (github.com/rhx/gir2swift)
#
. ./config.sh
./package.sh fetch
GOBJECT_LIBDIR=`pkg-config --libs-only-L gobject-introspection-1.0 2>/dev/null | tr ' ' '\n' | grep gobject-introspection | tail -n1 | cut -c3-`
GOBJECT_DIR=`dirname "${GOBJECT_LIBDIR}"`
for prefix in $PREFIX GOBJECT_DIR /usr/local /usr ; do
	gir_dir=${prefix}/share/gir-1.0
	gir=${gir_dir}/${module}.gir
	if [ -e "${gir}" ] ; then
		export GIR=${gir}
		export GIR_DIR=${gir_dir}
	fi
done
if [ ! -e "${GIR}" ] ; then
	echo "*** ${GIR} does not exist!"
	echo "Make sure libgirepository1.0-dev is installed"
	echo "and can be found in /usr /usr/local or by pkg-config!"
	exit 1
fi
for gen in Packages/*/generate-wrapper.sh ; do
	( cd `dirname $gen` && ./`basename $gen` )
done
gir2swift -p ${GIR_DIR}/GLib-2.0.gir -p ${GIR_DIR}/GObject-2.0.gir "${GIR}" | sed -f ${module}.sed > Sources/${Module}.swift
echo  > Sources/Swift${Mod}.swift "import CGLib"
echo  > Sources/Swift${Mod}.swift "import CCairo"
echo >> Sources/Swift${Mod}.swift "import GLib"
echo >> Sources/Swift${Mod}.swift "import GObject"
echo >> Sources/Swift${Mod}.swift ""
grep 'public protocol' Sources/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/public typealias _cairo_\1 = \1/' >> Sources/Swift${Mod}.swift
echo >> Sources/Swift${Mod}.swift ""
grep 'public class' Sources/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/public typealias _cairo_\1 = \1/' >> Sources/Swift${Mod}.swift
echo >> Sources/Swift${Mod}.swift ""
echo >> Sources/Swift${Mod}.swift "public struct cairo {"
grep 'public protocol' Sources/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/    public typealias \1 = _cairo_\1/' >> Sources/Swift${Mod}.swift
echo >> Sources/Swift${Mod}.swift ""
grep 'public class' Sources/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/    public typealias \1 = _cairo_\1/' >> Sources/Swift${Mod}.swift
echo >> Sources/Swift${Mod}.swift ""
grep 'public typealias' Sources/${Module}.swift | grep -v FontType | sed 's/^/    /' >> Sources/Swift${Mod}.swift
echo >> Sources/Swift${Mod}.swift "}"
