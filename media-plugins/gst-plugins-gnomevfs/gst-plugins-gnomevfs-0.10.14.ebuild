# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-gnomevfs/gst-plugins-gnomevfs-0.10.14.ebuild,v 1.9 2008/01/10 09:51:03 vapier Exp $

inherit gst-plugins-base

KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=media-libs/gst-plugins-base-0.10.13.1
	>=gnome-base/gnome-vfs-2"
DEPEND="${RDEPEND}"

GST_PLUGINS_BUILD="gnome_vfs"
