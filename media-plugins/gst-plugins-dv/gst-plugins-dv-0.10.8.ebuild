# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-dv/gst-plugins-dv-0.10.8.ebuild,v 1.6 2008/08/08 18:09:57 maekke Exp $

inherit gst-plugins-good

KEYWORDS="alpha amd64 ppc ppc64 x86"

GST_PLUGINS_BUILD="libdv"
DESCRIPTION="GStreamer plugin to decode DV"

IUSE=""
RDEPEND=">=media-libs/libdv-0.100
	>=media-libs/gstreamer-0.10.18
	>=media-libs/gst-plugins-base-0.10.18"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"
