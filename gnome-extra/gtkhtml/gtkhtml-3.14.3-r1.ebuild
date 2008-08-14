# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gtkhtml/gtkhtml-3.14.3-r1.ebuild,v 1.11 2008/04/20 02:10:15 vapier Exp $
EAPI="1"

inherit gnome2 eutils

DESCRIPTION="Lightweight HTML Rendering/Printing/Editing Engine"
HOMEPAGE="http://www.gnome.org/"

LICENSE="GPL-2 LGPL-2"
SLOT="3.14"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE="static"

RDEPEND=">=gnome-base/gail-1.1
	>=gnome-base/libgnomeui-2
	>=x11-libs/gtk+-2.10
	>=gnome-base/libglade-2
	>=gnome-base/libbonoboui-2.2.4
	>=gnome-base/orbit-2
	>=gnome-base/libbonobo-2
	net-libs/libsoup:2.2
	>=x11-libs/pango-1.15.2
	>=x11-themes/gnome-icon-theme-1.2"

DEPEND="${RDEPEND}
	  sys-devel/gettext
	>=dev-util/intltool-0.35.5
	>=dev-util/pkgconfig-0.9"

DOCS="AUTHORS BUGS ChangeLog NEWS README TODO"

pkg_setup() {
	ELTCONF="--reverse-deps"
	G2CONF="$(use_enable static) --enable-file-chooser"
}

src_unpack() {
	gnome2_src_unpack

	# A fix for a html_object_get_left_margin related crashes
	epatch "${FILESDIR}/${P}-get_left_margin-fix.patch"
}

src_unpack() {
	gnome2_src_unpack

	# Fix deprecated API disabling in used glib library - this is not future-proof, bug 210657
	sed -i -e '/G_DISABLE_DEPRECATED/d' \
		"${S}/src/Makefile.am" "${S}/src/Makefile.in" \
		"${S}/components/html-editor/Makefile.am" "${S}/components/html-editor/Makefile.in"

	sed -i -e 's:-DGTK_DISABLE_DEPRECATED=1 -DGDK_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATED=1 -DGNOME_DISABLE_DEPRECATED=1::g' \
		"${S}/a11y/Makefile.am" "${S}/a11y/Makefile.in"
}
