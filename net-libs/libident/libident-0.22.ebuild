# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libident/libident-0.22.ebuild,v 1.13 2005/08/07 13:40:47 hansmi Exp $

DESCRIPTION="A small library to interface to the Ident protocol server"
HOMEPAGE="ftp://ftp.lysator.liu.se/pub/ident/libs"
SRC_URI="ftp://ftp.lysator.liu.se/pub/ident/libs/${P}.tar.gz"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="alpha amd64 ~hppa ia64 ~mips ppc s390 ~sparc x86"
IUSE=""
DEPEND="virtual/libc"

src_compile() {
	emake CFLAGS="${CFLAGS} -fPIC -DHAVE_ANSIHEADERS" all || die
}

src_install() {
	dodoc README
	insinto /usr/include
	doins ident.h
	dolib.a libident.a
	doman ident.3
}
