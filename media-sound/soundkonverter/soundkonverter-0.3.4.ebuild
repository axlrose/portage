# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/soundkonverter/soundkonverter-0.3.4.ebuild,v 1.4 2008/07/27 21:51:36 carlo Exp $

inherit kde eutils

DESCRIPTION="SoundKonverter: a frontend to various audio converters for KDE"
HOMEPAGE="http://kde-apps.org/content/show.php?content=29024"
SRC_URI="http://hessijames.googlepages.com/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE="ffmpeg flac kdeenablefinal mp3 musepack vorbis"

DEPEND=">=media-libs/taglib-1.4
	>=media-sound/cdparanoia-3.9.8-r5"

RDEPEND="mp3? ( >=media-sound/lame-3.96 )
	vorbis? ( >=media-sound/vorbis-tools-1.0 )
	flac? ( >=media-libs/flac-1.1.1 )
	ffmpeg? ( >=media-video/ffmpeg-0.4.8 )
	musepack? ( >=media-sound/musepack-tools-1.15u )"
need-kde 3.5

src_compile() {
	append-flags -fno-inline
	local myconf="--without-mp4v2
			$(use_enable kdeenablefinal final)
			$(use_with arts )"
	kde_src_compile || die "Compile error"
}

src_install() {
	kde_src_install || die "Installation failed"
	mv ${D}/usr/share/doc/HTML ${D}/usr/share/doc/${PF}
}
