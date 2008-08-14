# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-fs/autofs/autofs-3.1.7-r5.ebuild,v 1.17 2007/05/06 10:07:34 genone Exp $

IUSE="ldap"

DESCRIPTION="Kernel based automounter"
HOMEPAGE="http://www.linux-consulting.com/Amd_AutoFS/autofs.html"
SRC_URI="mirror://kernel/linux/daemons/autofs/${P}.tar.bz2"

DEPEND="ldap? ( >=net-nds/openldap-1.2 )"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="alpha ia64 ppc sparc x86"

src_unpack() {
	unpack ${A}
	cd ${S}
	patch -p0 < ${FILESDIR}/ldap_config.patch || die

	cd ${S}/include
	patch -p0 < ${FILESDIR}/automount.diff || die

	cd ${S}/daemon
	mv Makefile Makefile.orig
	sed -e 's/LIBS \= \-ldl/LIBS \= \-ldl \-lnsl \$\{LIBLDAP\}/' Makefile.orig > Makefile
}

src_compile() {
	local myconf
	use ldap || myconf="--without-openldap"

	./configure \
	    --host=${HOST} \
	    --prefix=/usr \
	    ${myconf} || die
	make || die
}

src_install() {
	into /usr
	dosbin daemon/automount
	insinto /usr/lib/autofs
	insopts -m 755
	doins modules/*.so

	dodoc COPYING COPYRIGHT NEWS README* TODO
	cd man
	doman auto.master.5 autofs.5 autofs.8 automount.8

	cd ../samples
	dodir /etc/autofs
	cp ${FILESDIR}/auto.master ${D}/etc/autofs
	cp ${FILESDIR}/auto.misc ${D}/etc/autofs

	exeinto /etc/init.d ; newexe ${FILESDIR}/autofs.rc8 autofs
	insinto /etc/conf.d ; newins ${FILESDIR}/autofs.confd autofs
}

pkg_postinst() {
	elog "Note: If you plan on using autofs for automounting"
	elog "remote NFS mounts without having the NFS daemon running"
	elog "please add portmap to your default run-level."
	elog
	elog "Also the normal autofs status has been renamed stats"
	elog "as there is already a predefined Gentoo status"
}
