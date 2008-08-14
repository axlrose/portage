# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gentoo-artwork/gentoo-artwork-0.4.2.ebuild,v 1.6 2007/10/15 19:04:31 cla Exp $

BI_VER="20060811"

DESCRIPTION="A collection of miscellaneous Gentoo Linux logos and artwork"
SRC_URI="mirror://gentoo/gentoo-artwork-0.2.tar.bz2
		 mirror://gentoo/gentoo-artwork-0.3.tar.bz2
		 mirror://gentoo/gentoo-artwork-0.4.tar.bz2
		 mirror://gentoo/gentoo-artwork-0.4.1.tar.bz2
		 mirror://gentoo/gentoo-artwork-0.4.2.tar.bz2
		 mirror://gentoo/gentoo-bubble-icons-${BI_VER}.tar.gz"
HOMEPAGE="http://www.gentoo.org/index-graphics.html"

KEYWORDS="alpha amd64 ppc ppc64 sparc x86 ~x86-fbsd"
LICENSE="GPL-2"
SLOT="0"
IUSE="kde offensive"
RESTRICT="binchecks strip"

DEPEND=""

src_unpack() {
	unpack gentoo-artwork-0.2.tar.bz2
	# rename unpacked dir so that updated files get overwritten
	mv "${WORKDIR}"/gentoo-artwork-0.2 "${WORKDIR}"/gentoo-artwork-0.3
	unpack gentoo-artwork-0.3.tar.bz2
	mv "${WORKDIR}"/gentoo-artwork-0.3 "${WORKDIR}"/gentoo-artwork-0.4
	unpack gentoo-artwork-0.4.tar.bz2
	mv "${WORKDIR}"/gentoo-artwork-0.4 "${WORKDIR}"/gentoo-artwork-0.4.1
	unpack gentoo-artwork-0.4.1.tar.bz2
	mv "${WORKDIR}"/gentoo-artwork-0.4.1 "${WORKDIR}"/gentoo-artwork-0.4.2
	unpack gentoo-artwork-0.4.2.tar.bz2

	# Gentoo Bubble Icons
	unpack gentoo-bubble-icons-${BI_VER}.tar.gz
	cd "${WORKDIR}"/gentoo-artwork-0.4.2/icons/gentoo

	cp "${FILESDIR}"/index.theme .

	mv l33t/l33t_BRO_lynx.png l33t/l33t_BRO_lynx2.png
	mv "${WORKDIR}"/gentoo-bubble-icons/README bubble-icons-README
	find "${WORKDIR}"/gentoo-bubble-icons -name '*.png' \
		-exec mv "{}" l33t/ \;

	# fix errors in filenames
	mv l33t/l33t_nero.png l33t/l33t_UTI_nero.png

	mv "${S}"/pixmaps/1280x1024/gentoo-freedom-1280x1024,jpg \
		"${S}"/pixmaps/1280x1024/gentoo-freedom-1280x1024.jpg

	# remove misspelled files
	rm "${S}"/icons/gentoo/{32x32,48x48,64x64}/slypheed.png

	# bug #132271
	rm "${S}"/pixmaps/1024x768/gentoo-blue-leaf-1024x768.jpg
	rm "${S}"/pixmaps/1024x768/gentoo-blue-ute-1024x768.jpg

	if ! use offensive ; then
		for i in $(<"${FILESDIR}"/offensive_list) ; do
			rm -f "${S}/${i}"
		done
	fi
}

src_install() {
	# pixmaps
	dodir /usr/share/pixmaps/gentoo/
	cd "${S}"/pixmaps
	cp -pPR . "${D}"/usr/share/pixmaps/gentoo/
	rm "${D}"/usr/share/pixmaps/gentoo/CREDITS

	if use kde ; then
		# a Gentoo colour scheme for KDE
		insinto /usr/share/apps/kdisplay/color-schemes
		doins "${S}"/misc/Gentoo.kcsrc
	fi

	# Gentoo icons
	dodir /usr/share/icons/gentoo
	cp -pR "${S}"/icons/gentoo/* "${D}"/usr/share/icons/gentoo/

	# grub splash images
	dodir /usr/share/grub/splashimages
	insinto /usr/share/grub/splashimages
	doins "${S}"/grub/*.xpm.gz

	# lilo splash images
	dodir /usr/share/lilo/splashimages
	insinto /usr/share/lilo/splashimages
	doins "${S}"/lilo/*

	dodoc "${S}"/pixmaps/CREDITS
}

pkg_postinst() {
	einfo "See:"
	einfo "  http://dev.gentoo.org/~spock/gentoo/artwork.php"
	einfo "for information about submitting new artwork for this package."
}
