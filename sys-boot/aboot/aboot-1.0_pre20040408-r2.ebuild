# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-boot/aboot/aboot-1.0_pre20040408-r2.ebuild,v 1.3 2007/12/13 20:42:35 yoswink Exp $

inherit eutils

KERN_VER="2.6.22"

DESCRIPTION="Alpha Linux boot loader for SRM"
HOMEPAGE="http://aboot.sourceforge.net/"
SRC_URI="http://aboot.sourceforge.net/tarballs/${P}.tar.bz2
	mirror://gentoo/gentoo-headers-base-${KERN_VER}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* alpha"
IUSE=""

DEPEND=""
PROVIDE="virtual/bootloader"

src_unpack() {
	unpack ${A}
	# setup local copies of kernel headers since we rely so
	# heavily on linux internals.
	mv gentoo-headers-base-${KERN_VER}/include/{linux,asm-generic,asm-alpha} "${S}"/include/ || die
	cd "${S}"/include
	ln -s asm-alpha asm || die
	touch linux/config.h || die
	cd "${S}"
	sed -i '1i#define bool int' cons.c
	sed -i "s:/usr/man:/usr/share/man:" Makefile || die
	epatch "${FILESDIR}/aboot-gcc-3.4.patch"
	epatch "${FILESDIR}/aboot-pt_note.patch"
}

src_compile() {
	# too many problems with parallel building
	emake -j1 || die "emake failed"
}

src_install() {
	dodir /boot /sbin /usr/share/man/man5
	make \
		root="${D}" \
		bindir="${D}"/sbin \
		bootdir="${D}"/boot \
		mandir="${D}"/usr/share/man \
		install

	dodoc ChangeLog INSTALL README TODO aboot.conf

	insinto /etc
	newins "${FILESDIR}"/aboot.conf aboot.conf.example
}

pkg_postinst() {
	einfo "To make aboot install a new bootloader on your harddisk follow"
	einfo "these steps:"
	einfo ""
	einfo " - edit the file /etc/aboot.conf"
	einfo " - cd /boot"
	einfo " - swriteboot -c2 /dev/sda bootlx"
	einfo " This will install a new bootsector on /dev/sda and aboot will"
	einfo " use the second partition on this device to lookup kernel and "
	einfo " initrd (as described in the aboot.conf file)"
	einfo ""
	einfo "IMPORTANT :"
	einfo ""
	einfo "The partition table of your boot device has to contain "
	einfo "a BSD-DISKLABEL and the first 12 megabytes of your boot device"
	einfo "must not be part of a partition as aboot will write its bootloader"
	einfo "in there and not as with most x86 bootloaders into the "
	einfo "master boot sector. If your partition table does not reflect this"
	einfo "you are going to destroy your installation !"
	einfo "Also note that aboot currently only supports ext2/3 partitions"
	einfo "to boot from."
}
