# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/super_demux/super_demux-0.3.ebuild,v 1.1 2007/10/06 15:04:03 sbriesen Exp $

inherit eutils toolchain-funcs flag-o-matic

IUSE=""

DESCRIPTION="DVB transport stream TS to ES demultiplexer"
HOMEPAGE="http://panteltje.com/panteltje/dvd/"
SRC_URI="http://panteltje.com/panteltje/dvd/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}.diff"
}

src_compile() {
	append-flags -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE	-D_LARGEFILE64_SOURCE
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	dobin super_demux
	dodoc CHANGES README
}
