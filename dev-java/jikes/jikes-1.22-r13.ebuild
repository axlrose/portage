# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/jikes/jikes-1.22-r13.ebuild,v 1.10 2007/05/28 18:31:30 vapier Exp $

inherit flag-o-matic eutils

DESCRIPTION="IBM's open source, high performance Java compiler"
HOMEPAGE="http://jikes.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="IBM"
SLOT="0"
KEYWORDS="amd64 arm ia64 ppc ppc64 x86 ~x86-fbsd"
IUSE=""
DEPEND=""
RDEPEND=">=dev-java/java-config-2.0.0"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/deprecated.patch
}

src_compile() {
	filter-flags "-fno-rtti"
	econf || die "configure problem"
	emake || die "compile problem"
}

src_install () {
	make DESTDIR=${D} install || die "install problem"
	dodoc ChangeLog AUTHORS README TODO NEWS

	mv ${D}/usr/bin/jikes{,-bin}
	dobin ${FILESDIR}/jikes

	insinto /usr/share/java-config-2/compiler
	newins ${FILESDIR}/compiler-settings jikes
}
