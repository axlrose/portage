# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/propel-runtime/propel-runtime-1.2.1.ebuild,v 1.2 2007/03/18 02:51:49 chtekk Exp $

inherit php-pear-lib-r1

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Object Persistence Layer for PHP 5 (Runtime)."
HOMEPAGE="http://propel.phpdb.org/trac/wiki/"
SRC_URI="http://pear.phpdb.org/get/propel_runtime-${PV}.tgz"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=dev-php5/creole-1.1.0
		>=dev-php/PEAR-Log-1.8.7-r1"

S="${WORKDIR}/propel_runtime-${PV}"

need_php_by_category
