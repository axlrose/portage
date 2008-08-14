# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/stardict-cdict-en-zh-gb/stardict-cdict-en-zh-gb-2.4.2.ebuild,v 1.8 2007/02/01 14:39:01 blubb Exp $

FROM_LANG="English"
TO_LANG="Simplified Chinese (GB)"
DICT_PREFIX="cdict-"
DICT_SUFFIX="gb"

inherit stardict

HOMEPAGE="http://stardict.sourceforge.net/Dictionaries_zh_CN.php"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND=">=app-dicts/stardict-2.4.2"
