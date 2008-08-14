# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-board/xmille/xmille-2.0-r1.ebuild,v 1.11 2006/12/01 21:13:02 wolf31o2 Exp $

inherit eutils games

DEB_PATCH_VER="12"
DESCRIPTION="Mille Bournes card game"
HOMEPAGE="http://www.milleborne.info/"
SRC_URI="mirror://debian/pool/main/x/xmille/${PN}_${PV}.orig.tar.gz
	mirror://debian/pool/main/x/xmille/${PN}_${PV}-${DEB_PATCH_VER}.diff.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE=""

RDEPEND="x11-libs/libXext"
DEPEND="${RDEPEND}
	app-text/rman
	x11-misc/imake"

S=${WORKDIR}/${P}.orig

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${WORKDIR}/${PN}_${PV}-${DEB_PATCH_VER}.diff"
}

src_compile() {
	xmkmf
	emake -j1 || die "emake failed"
}

src_install() {
	dogamesbin xmille || die "dogamesbin failed"
	dodoc CHANGES README
	newman xmille.man xmille.6
	prepgamesdirs
}
