# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-puzzle/gnudoku/gnudoku-0.93.ebuild,v 1.6 2008/05/04 20:32:35 nyhm Exp $

inherit eutils games

MY_PN="GNUDoku"
MY_P=${MY_PN}-${PV}
DESCRIPTION="A program for creating and solving Su Doku puzzles"
HOMEPAGE="http://www.icculus.org/~jcspray/GNUDoku"
SRC_URI="http://www.icculus.org/~jcspray/GNUDoku/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""
RESTRICT="test"

RDEPEND=">=dev-cpp/gtkmm-2.6"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-gcc43.patch
	sed -i \
		-e "s:\$(CXX):\$(CXX) ${CXXFLAGS} ${LDFLAGS}:" \
		Makefile \
		|| die "sed failed"
}

src_install() {
	dogamesbin GNUDoku || die "dogamesbin failed"
	newicon GNUDoku.png ${PN}.png
	make_desktop_entry ${MY_PN} ${MY_PN}
	dodoc ALGORITHM Changelog README TODO
	prepgamesdirs
}
