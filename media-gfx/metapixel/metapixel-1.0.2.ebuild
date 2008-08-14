# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/metapixel/metapixel-1.0.2.ebuild,v 1.2 2008/01/09 11:20:50 maekke Exp $

inherit toolchain-funcs

DESCRIPTION="a program for generating photomosaics"
HOMEPAGE="http://www.complang.tuwien.ac.at/schani/metapixel"
SRC_URI="http://www.complang.tuwien.ac.at/schani/${PN}/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libpng
	media-libs/giflib
	media-libs/jpeg
	dev-lang/perl"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i -e "s:/usr/X11R6:/usr:g" Makefile
	sed -i -e "s:ar:$(tc-getAR):" rwimg/Makefile
}

src_compile() {
	emake CC="$(tc-getCC)" OPTIMIZE="${CFLAGS}" \
		LDOPTS="${LDFLAGS}" || die "emake failed."
}

src_install() {
	dobin ${PN}{,-prepare,-imagesize,-sizesort}
	doman ${PN}.1
	dodoc NEWS README
}
