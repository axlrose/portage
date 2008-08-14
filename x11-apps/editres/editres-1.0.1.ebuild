# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/editres/editres-1.0.1.ebuild,v 1.9 2008/01/13 09:35:49 vapier Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="a dynamic resource editor for X Toolkit applications"

KEYWORDS="arm ~mips ~ppc ppc64 s390 sh ~sparc x86"
IUSE="xprint"

RDEPEND="x11-libs/libX11
	x11-libs/libXt
	x11-libs/libXmu
	x11-libs/libXaw"
DEPEND="${RDEPEND}"

CONFIGURE_OPTIONS="$(use_enable xprint)"

pkg_setup() {
	if use xprint && ! built_with_use x11-libs/libXaw xprint; then
		die "Build x11-libs/libXaw with USE=xprint."
	fi
}
