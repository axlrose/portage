# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/ersatz-emacs/ersatz-emacs-20060515.ebuild,v 1.6 2008/02/24 17:21:37 opfer Exp $

inherit eutils toolchain-funcs

DESCRIPTION="A very minimal imitation of the famous GNU Emacs editor"
HOMEPAGE="http://hunter.apana.org.au/~cjb/Code/"
# taken from http://hunter.apana.org.au/~cjb/Code/ersatz.tar.gz
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}
	!app-editors/easyedit"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-gentoo.patch
	sed -i -e "s%/usr/local/share/%/usr/share/doc/${PF}/%" ee.1 \
		|| die "sed failed"
}

src_compile() {
	emake CC="$(tc-getCC)" \
		CFLAGS="-Wall ${CFLAGS}" \
		LFLAGS="-lncurses" || die "emake failed"
}

src_install() {
	# Note: /usr/bin/ee is "easy edit" on FreeBSD, so if this
	# is ever keyworded *-fbsd the binary has to be renamed.
	dobin ee
	doman ee.1
	dodoc ChangeLog ERSATZ.keys README || die "dodoc failed"
}
