# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/xevil/xevil-2.02_p2-r1.ebuild,v 1.3 2008/01/06 01:27:58 mr_bones_ Exp $

inherit eutils games

DEB_PATCH=7
MY_PV=${PV/_p/r}
DESCRIPTION="3rd person, side-view, fast-action, kill-them-before-they-kill-you game"
HOMEPAGE="http://www.xevil.com/"
SRC_URI="http://www.xevil.com/download/stable/xevilsrc${MY_PV}.zip
	mirror://debian/pool/main/x/xevil/xevil_${MY_PV}-${DEB_PATCH}.diff.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="ppc x86"
IUSE=""

RDEPEND="x11-libs/libXpm"
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	edos2unix readme.txt x11/*.{cpp,h} cmn/*.{cpp,h} makefile config.mk
	epatch "${WORKDIR}"/xevil_${MY_PV}-${DEB_PATCH}.diff
	sed -i \
		-e 's:-static::' \
		-e "s:CFLAGS=\":CFLAGS=\"${CFLAGS} :g" \
		-e 's:-lXpm:-lXpm -lpthread:g' \
		config.mk || die "sed failed"
}

src_compile() {
	emake STRIP=true || die "emake failed"
}

src_install() {
	dogamesbin x11/REDHAT_LINUX/xevil || die "dogamesbin failed"
	newgamesbin x11/REDHAT_LINUX/serverping xevil-serverping \
		|| die "newgamesbin failed"
	dodoc readme.txt
	prepgamesdirs
}
