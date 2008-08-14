# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-clem/cl-clem-0.1.6.20060104.ebuild,v 1.1 2006/01/04 23:24:59 mkennedy Exp $

inherit common-lisp eutils

DESCRIPTION="Cyrus Harmon's Common Lisp matrix mathematics library."
HOMEPAGE="http://www.cyrusharmon.org/cl/blog/"
SRC_URI="http://cyrusharmon.org/cl/static/releases/clem-${PV/.2006/-2006}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""
DEPEND="dev-lisp/cl-ch-util"
S=${WORKDIR}/clem

CLPACKAGE='clem clem-test'

src_unpack() {
	unpack ${A}
	epatch ${FILESDIR}/${PV}-fasl-output-gentoo.patch || die
}

src_install() {
	dodir $CLSYSTEMROOT
	insinto $CLSOURCEROOT/clem
	doins *.asd
	insinto $CLSOURCEROOT/clem/src/
	doins src/*.cl
	insinto $CLSOURCEROOT/clem/src/typed-ops
	doins src/typed-ops/*.cl
	insinto $CLSOURCEROOT/clem/test/
	doins test/*.cl
	dosym ${CLSOURCEROOT}/clem/clem.asd ${CLSYSTEMROOT}/clem.asd
	dosym ${CLSOURCEROOT}/clem/clem-test.asd ${CLSYSTEMROOT}/clem-test.asd
}
