# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xtermcontrol/xtermcontrol-2.9.ebuild,v 1.4 2008/06/21 11:05:53 drac Exp $

DESCRIPTION="xtermcontrol enables dynamic control of XFree86 xterm properties."
HOMEPAGE="http://www.thrysoee.dk/xtermcontrol"
SRC_URI="http://www.thrysoee.dk/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ~ppc x86"
IUSE=""

DEPEND=""

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc ChangeLog
}
