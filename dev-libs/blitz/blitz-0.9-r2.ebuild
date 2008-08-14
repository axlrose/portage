# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/blitz/blitz-0.9-r2.ebuild,v 1.2 2008/05/17 10:29:38 bicatali Exp $

inherit eutils

DESCRIPTION="High-performance C++ numeric library"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
HOMEPAGE="http://www.oonumerics.org/blitz"
IUSE="debug doc examples"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
LICENSE="|| ( GPL-2 Blitz-Artistic )"

DEPEND="doc? ( app-doc/doxygen )"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	# remove examples compiling
	sed -i \
		-e 's/blitz-uninstalled.pc//' \
		-e 's/examples//g' \
		Makefile.in || die "sed failed"
	epatch "${FILESDIR}"/${P}-gcc-4.3-missing-includes.patch
}

src_compile() {
	# blas and fortran are only useful for benchmarks
	econf \
		--enable-shared \
		--disable-cxx-flags-preset \
		--disable-fortran \
		--without-blas \
		$(use_enable doc doxygen) \
		$(use_enable doc html-docs) \
		$(use_enable debug) \
		|| die "econf failed"
	emake lib || die "emake lib failed"
}

src_test() {
	# exprctor fails if BZ_DEBUG flag is not set
	# CXXFLAGS gets overwritten
	emake AM_CXXFLAGS="-DBZ_DEBUG" check-testsuite || die "selftest failed"
}

src_install () {
	dodir /usr/share/doc/${PF}/html
	emake \
		DESTDIR="${D}" \
		docdir=/usr/share/doc/${PF}/html \
		install || die "emake install failed"
	dodoc ChangeLog ChangeLog.1 README README.binutils TODO AUTHORS NEWS

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*.cpp
	fi
}
