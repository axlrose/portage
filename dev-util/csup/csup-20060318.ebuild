# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/csup/csup-20060318.ebuild,v 1.6 2008/04/14 12:09:03 flameeyes Exp $

inherit toolchain-funcs eutils

DESCRIPTION="C-based rewrite of CVSup (software for distributing and updating collections of files accross a network)"
HOMEPAGE="http://www.mu.org/~mux/csup.html"
SRC_URI="http://mu.org/~mux/csup-snap-${PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE=""

DEPEND="dev-libs/openssl
	sys-libs/zlib"

RDEPEND="${DEPEND}
	!>=sys-freebsd/freebsd-ubin-6.2_beta1"

DEPEND="${DEPEND}
	>=sys-devel/bison-2.1"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-respectflags.patch"
}

src_compile() {
	# unable to work with yacc, but bison is ok.
	emake \
		CC="$(tc-getCC)" \
		PREFIX=/usr YACC=bison || die "emake failed"
}

src_install() {
	# instead of using make install, just copy the stuff directly
	dobin csup || die "failed to install executable"
	doman csup.1 || die "failed to install man page"
	dodoc README
}
