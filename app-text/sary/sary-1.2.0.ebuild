# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/sary/sary-1.2.0.ebuild,v 1.16 2008/01/20 16:08:30 grobian Exp $

IUSE=""

DESCRIPTION="Sary: suffix array library and tools"
HOMEPAGE="http://sary.sourceforge.net/"
SRC_URI="http://sary.sourceforge.net/${P}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86"
SLOT="0"
RESTRICT="test"

RDEPEND=">=dev-libs/glib-2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {

	make DESTDIR="${D}" \
		docsdir=/usr/share/doc/${PF}/html \
		install || die

	dodoc [A-Z][A-Z]* ChangeLog

}
