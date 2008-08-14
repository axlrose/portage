# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-ogg/gst-plugins-ogg-0.10.20.ebuild,v 1.7 2008/08/08 18:47:39 maekke Exp $

inherit gst-plugins-base

KEYWORDS="alpha amd64 ~arm ~hppa ia64 ppc ppc64 ~sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="media-libs/libogg
	>=media-libs/gst-plugins-base-0.10.20"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"
