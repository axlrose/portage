# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/mplay-sh/mplay-sh-0.5.3.ebuild,v 1.1 2007/05/15 11:57:30 zzam Exp $

inherit eutils

MY_P="mplay-${PV}"

DESCRIPTION="mplayer wrapper script as backend for vdr-mplayer"
HOMEPAGE="http://www.vdr-portal.de/board/thread.php?threadid=62306"
SRC_URI="mirror://gentoo/${MY_P}.tgz
	http://dev.gentoo.org/~zzam/distfiles/${MY_P}.tgz"

KEYWORDS="~x86"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

RDEPEND=">=media-video/mplayer-0.90_rc4"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack "${A}"
	cd "${S}"
	sed -i mplay.sh \
		-e 's#$CONFDIR/silence.wav#/usr/share/vdr/mplay-sh/silence.wav#'
}

src_install() {
	exeinto /usr/share/vdr/mplayer/bin
	doexe mplay.sh

	insinto /etc/vdr/plugins/mplay
	doins conf.examples/*.conf conf.examples/mplayrc

	insinto /usr/share/vdr/mplay-sh
	doins conf.examples/silence.wav

	dodoc README* HISTORY
}
