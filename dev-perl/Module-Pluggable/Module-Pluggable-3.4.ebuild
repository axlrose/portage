# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Module-Pluggable/Module-Pluggable-3.4.ebuild,v 1.4 2007/03/08 17:37:04 ticho Exp $

inherit perl-module

DESCRIPTION="automatically give your module the ability to have plugins"
HOMEPAGE="http://search.cpan.org/search?query=${PN}"
SRC_URI="mirror://cpan/authors/id/S/SI/SIMONW/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc sparc x86"
IUSE=""

SRC_TEST="do"

DEPEND=">=dev-perl/module-build-0.28
	dev-perl/Class-Inspector
	dev-lang/perl"
