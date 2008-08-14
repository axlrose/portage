# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/aspell-be/aspell-be-0.01.ebuild,v 1.6 2007/07/11 05:41:18 mr_bones_ Exp $

ASPELL_LANG="Belarusian"

inherit eutils aspell-dict

LICENSE="GPL-2"

KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86"

SRC_URI="mirror://gnu/aspell/dict/be/aspell5-be-${PV}.tar.bz2"
S="${WORKDIR}/aspell5-be-${PV}"

src_unpack() {
	unpack ${A}
	use classic || epatch ${FILESDIR}/aspell5-be-${PV}-official.patch
}
