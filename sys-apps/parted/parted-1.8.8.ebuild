# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/parted/parted-1.8.8.ebuild,v 1.13 2007/12/11 10:42:44 vapier Exp $

inherit eutils

DESCRIPTION="Create, destroy, resize, check, copy partitions and file systems"
HOMEPAGE="http://www.gnu.org/software/parted"
SRC_URI="mirror://gnu/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86"
IUSE="nls readline debug selinux device-mapper"

# specific version for gettext needed
# to fix bug 85999
DEPEND=">=sys-fs/e2fsprogs-1.27
	>=sys-libs/ncurses-5.2
	nls? ( >=sys-devel/gettext-0.12.1-r2 )
	readline? ( >=sys-libs/readline-5.2 )
	selinux? ( sys-libs/libselinux )
	device-mapper? ( sys-fs/device-mapper )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-t3100-test-success.patch
}

src_compile() {
	econf \
		$(use_with readline) \
		$(use_enable nls) \
		$(use_enable debug) \
		$(use_enable selinux) \
		$(use_enable device-mapper) \
		--disable-rpath \
		--disable-Werror || die "Configure failed"
	emake || die "Make failed"
}

src_install() {
	make install DESTDIR="${D}" || die "Install failed"
	dodoc AUTHORS BUGS ChangeLog NEWS README THANKS TODO
	dodoc doc/{API,FAT,USER.jp}
}
