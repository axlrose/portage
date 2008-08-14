# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gnome-icon-theme/gnome-icon-theme-2.22.0.ebuild,v 1.6 2008/08/12 13:34:32 armin76 Exp $

inherit gnome2

DESCRIPTION="GNOME 2 default icon themes"
HOMEPAGE="http://www.gnome.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ~hppa ia64 ~mips ppc ~ppc64 ~sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=x11-themes/hicolor-icon-theme-0.10"
DEPEND="${RDEPEND}
	>=x11-misc/icon-naming-utils-0.8.1
	>=dev-util/pkgconfig-0.19
	>=dev-util/intltool-0.35
	sys-devel/gettext"

DOCS="AUTHORS ChangeLog NEWS TODO"

# This ebuild does not install any binaries
RESTRICT="binchecks strip"
