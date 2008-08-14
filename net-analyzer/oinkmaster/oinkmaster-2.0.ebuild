# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/oinkmaster/oinkmaster-2.0.ebuild,v 1.4 2007/08/13 21:23:48 dertobi123 Exp $

inherit eutils

DESCRIPTION="Rule management for SNORT"
SRC_URI="mirror://sourceforge/oinkmaster/${P}.tar.gz"
HOMEPAGE="http://oinkmaster.sf.net/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="X"

DEPEND=""
RDEPEND=">=dev-lang/perl-5.6.1
	X? ( dev-perl/perl-tk )
	net-misc/wget
	app-arch/tar
	app-arch/gzip"

src_install() {
	dobin oinkmaster.pl contrib/create-sidmap.pl contrib/addsid.pl \
		contrib/makesidex.pl contrib/addmsg.pl
	use X && dobin contrib/oinkgui.pl

	dodoc FAQ UPGRADING README README.win32 README.gui contrib/README.contrib
	doman oinkmaster.1

	insinto /etc
	doins oinkmaster.conf
}
