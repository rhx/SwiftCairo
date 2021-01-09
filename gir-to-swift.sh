#!/bin/sh
#
# Swift code wrapper generator for gobject-introspection (.gir) files.
# This needs an installed `gir2swift' executable (github.com/rhx/gir2swift)
#
. ./config.sh
mkdir -p Sources/${Mod}
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
gir2swift -p ${GIR_DIR}/GLib-2.0.gir -p ${GIR_DIR}/GObject-2.0.gir "${GIR}" | sed -f ${module}.sed > Sources/${Mod}/${Module}.swift
echo  > Sources/${Mod}/Swift${Mod}.swift "import CGLib"
echo  > Sources/${Mod}/Swift${Mod}.swift "import CCairo"
echo >> Sources/${Mod}/Swift${Mod}.swift "import GLib"
echo >> Sources/${Mod}/Swift${Mod}.swift "import GLibObject"
echo >> Sources/${Mod}/Swift${Mod}.swift ""
grep 'public protocol' Sources/${Mod}/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/public typealias _cairo_\1 = \1/' >> Sources/${Mod}/Swift${Mod}.swift
echo >> Sources/${Mod}/Swift${Mod}.swift ""
grep '^open class' Sources/${Mod}/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/public typealias _cairo_\1 = \1/' >> Sources/${Mod}/Swift${Mod}.swift
echo >> Sources/${Mod}/Swift${Mod}.swift ""
echo >> Sources/${Mod}/Swift${Mod}.swift "public struct cairo {"
grep 'public protocol' Sources/${Mod}/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/    public typealias \1 = _cairo_\1/' >> Sources/${Mod}/Swift${Mod}.swift
echo >> Sources/${Mod}/Swift${Mod}.swift ""
grep '^open class' Sources/${Mod}/${Module}.swift | cut -d' ' -f3 | cut -d: -f1 | sort -u | sed -e 's/^\(.*\)/    public typealias \1 = _cairo_\1/' >> Sources/${Mod}/Swift${Mod}.swift
echo >> Sources/${Mod}/Swift${Mod}.swift ""
grep '^public typealias' Sources/${Mod}/${Module}.swift | sed 's/^/    /' >> Sources/${Mod}/Swift${Mod}.swift
echo >> Sources/${Mod}/Swift${Mod}.swift "}"
