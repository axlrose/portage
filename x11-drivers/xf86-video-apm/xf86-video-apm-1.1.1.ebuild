# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-apm/xf86-video-apm-1.1.1.ebuild,v 1.6 2006/10/13 23:15:49 joshuabaergen Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="Alliance ProMotion video driver"
KEYWORDS="amd64 ia64 sh x86 ~x86-fbsd"
RDEPEND=">=x11-base/xorg-server-1.0.99"
DEPEND="${RDEPEND}
	x11-proto/fontsproto
	x11-proto/videoproto
	x11-proto/xextproto
	x11-proto/xf86rushproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/xproto"
