# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/lbxproxy/lbxproxy-1.0.1.ebuild,v 1.6 2008/01/13 09:35:45 vapier Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="Low BandWidth X proxy"
KEYWORDS="arm ~mips ~ppc ~ppc64 s390 sh ~sparc x86"
RDEPEND="x11-libs/xtrans
	x11-libs/libXext
	x11-libs/liblbxutil
	x11-libs/libX11
	x11-libs/libICE"
DEPEND="${RDEPEND}
	x11-proto/xproxymanagementprotocol"
IUSE="ipv6"

CONFIGURE_OPTIONS="$(use_enable ipv6)"
