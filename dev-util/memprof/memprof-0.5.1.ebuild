# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/memprof/memprof-0.5.1.ebuild,v 1.10 2008/10/14 02:07:45 darkside Exp $

inherit gnome2

DESCRIPTION="MemProf - Profiling and leak detection"
HOMEPAGE="http://www.gnome.org/projects/memprof/"
SRC_URI="${SRC_URI}
	http://dev.gentoo.org/~ticho/portage/bfd.h.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 -sparc"
IUSE=""

DEPEND=">=x11-libs/gtk+-2
	>=gnome-base/gconf-1.2
	>=gnome-base/libgnomeui-2
	>=gnome-base/libglade-2"

RDEPEND="${DEPEND}
	sys-devel/gettext"

DOCS="AUTHORS ChangeLog README NEWS"

src_unpack() {
	unpack ${A}
	cp bfd.h "${S}"
}
