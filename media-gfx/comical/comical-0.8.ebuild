# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/comical/comical-0.8.ebuild,v 1.7 2008/05/22 18:26:27 maekke Exp $

inherit wxwidgets eutils
DESCRIPTION="Comical is a sequential image display program, to deal with .cbr and .cbz files."
HOMEPAGE="http://comical.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2 unRAR"
SLOT="0"
KEYWORDS="~amd64 x86 ~x86-fbsd"
DEPEND="=x11-libs/wxGTK-2.6*"
IUSE=""

src_unpack() {
	unpack ${A}

	export WX_GTK_VER="2.6"
	need-wxwidgets unicode

	# Fix Makefiles
	cd "${S}"
	# replace wx-config for wx-config-2.6
	sed -i -e "s:wx-config:${WX_CONFIG}:" Makefile src/Makefile
	# CFLAGS
	sed -i -e "s:CFLAGS = -O2 -Wall -pipe:CFLAGS = ${CFLAGS}:" src/Makefile
	sed -i -e "s:CXXFLAGS=-O2 -fPIC:CXXFLAGS = ${CXXFLAGS} -fPIC:" unrar/makefile.linux
	sed -i -e "s:CFLAGS=-Os:CFLAGS = ${CFLAGS}:" unzip/Makefile
}

src_compile() {
	# Parallel build doesn't work.
	emake -j1 || die "emake failed"
}

src_install() {
	dobin comical
	dodoc AUTHORS ChangeLog README TODO
}
