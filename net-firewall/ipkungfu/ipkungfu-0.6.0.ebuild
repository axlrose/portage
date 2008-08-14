# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/ipkungfu/ipkungfu-0.6.0.ebuild,v 1.4 2007/10/28 13:11:53 phreak Exp $

inherit eutils

DESCRIPTION="A nice iptables firewall script"
HOMEPAGE="http://www.linuxkungfu.org/"
SRC_URI="http://www.linuxkungfu.org/ipkungfu/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="virtual/libc
	net-firewall/iptables"
RDEPEND="${DEPEND}
	virtual/logger"

src_compile() {
	econf || die "Could not run econf"
	emake || die "Couldn't run make"
}

src_install() {
	make DESTDIR=${D} install || die

	# Install configuration files
	make DESTDIR=${D} install-config || die

	# Install Gentoo init script
	newinitd ${FILESDIR}/ipkungfu.init ipkungfu
}

pkg_postinst() {
	# Remove the cache dir so ipkungfu won't fail when running for
	# the first time, case 0.6.0 was installed before.
	rm -rf /etc/ipkungfu/cache

	einfo "Be sure to, before running ipkungfu, edit the config files in:"
	einfo "/etc/ipkungfu/"
	echo
	einfo "Also, be sure to run ipkungfu prior to rebooting,"
	einfo "especially if you you're updating from <0.6.0 to >=0.6.0."
	einfo "There are some significant configuration changes on this"
	einfo "release covered by the ipkungfu script."
}
