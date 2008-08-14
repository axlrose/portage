# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-shells/bashdb/bashdb-3.1.0.09.ebuild,v 1.1 2007/12/27 20:00:37 vapier Exp $

MY_P="${PN}-${PV:0:3}-${PV:4}"
DESCRIPTION="bash source code debugging"
HOMEPAGE="http://bashdb.sourceforge.net/"
SRC_URI="mirror://sourceforge/bashdb/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/bash"

S=${WORKDIR}/${MY_P}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS NEWS README THANKS TODO
}
