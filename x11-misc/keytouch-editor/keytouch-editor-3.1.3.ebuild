# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/keytouch-editor/keytouch-editor-3.1.3.ebuild,v 1.3 2008/07/21 20:25:07 nyhm Exp $

inherit eutils linux-info

DESCRIPTION="Generates keyboard files for use by keyTouch"
HOMEPAGE="http://keytouch.sourceforge.net/"
SRC_URI="mirror://sourceforge/keytouch/${P}.tar.gz
	doc? ( mirror://sourceforge/keytouch/keytouch_editor_3.0.pdf )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc kde"

RDEPEND=">=x11-libs/gtk+-2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"
RDEPEND="${RDEPEND}
	kde? ( || (
		kde-base/kdesu
		kde-base/kdebase
	) )
	!kde? ( x11-libs/gksu )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-glibc28.patch
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	make_desktop_entry ${PN} "keyTouch editor" ${PN} System
	newicon pixmaps/icon.png ${PN}.png

	dodoc AUTHORS ChangeLog
	use doc && dodoc "${DISTDIR}"/*.pdf
}

pkg_postinst() {
	if ! linux_chkconfig_present INPUT_EVDEV ; then
		ewarn "To use ${PN}, CONFIG_INPUT_EVDEV must"
		ewarn "be enabled in your kernel config."
		ewarn
		ewarn "  Device Drivers"
		ewarn "    Input device support"
		ewarn "      <*>/<M> Event interface"
	fi
}
