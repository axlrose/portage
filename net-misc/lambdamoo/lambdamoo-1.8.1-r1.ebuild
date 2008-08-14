# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/lambdamoo/lambdamoo-1.8.1-r1.ebuild,v 1.9 2007/04/22 17:03:01 phreak Exp $

inherit eutils

DESCRIPTION="networked mud that can be used for different types of collaborative software"
HOMEPAGE="http://sourceforge.net/projects/lambdamoo/"
SRC_URI="mirror://sourceforge/lambdamoo/LambdaMOO-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~sparc"
IUSE=""

DEPEND="sys-devel/bison"
RDEPEND=""

S=${WORKDIR}/MOO-${PV}

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}"/${PV}-enable-outbound.patch
}

src_compile() {
	econf || die "econf failed!"
	emake CFLAGS="${CFLAGS} -DHAVE_MKFIFO=1" || die "emake failed!"
}

src_install() {
	dosbin moo
	insinto /usr/share/${PN}
	doins Minimal.db
	dodoc *.txt README*

	newinitd "${FILESDIR}"/lambdamoo.rc ${PN}
	newconfd "${FILESDIR}"/lambdamoo.conf ${PN}
}
