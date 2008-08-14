# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-geosciences/josm-plugins/josm-plugins-20080419.ebuild,v 1.1 2008/04/19 13:32:41 hanno Exp $

DESCRIPTION="Set of plugins for josm"
HOMEPAGE="http://josm.openstreetmap.de/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND=">=sci-geosciences/josm-1.5_p613"
IUSE=""

src_compile() {
	einfo Nothing to compile
}

src_install() {
	insinto /usr/lib/josm/plugins
	doins *.jar
}
