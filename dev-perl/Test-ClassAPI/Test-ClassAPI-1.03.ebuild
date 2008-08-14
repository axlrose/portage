# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Test-ClassAPI/Test-ClassAPI-1.03.ebuild,v 1.4 2007/05/05 18:04:17 dertobi123 Exp $

inherit perl-module

DESCRIPTION="Provides basic first-pass API testing for large class trees"
SRC_URI="mirror://cpan/authors/id/A/AD/ADAMK/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~adamk/"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~mips ppc sparc ~x86"
IUSE=""

DEPEND=">=virtual/perl-File-Spec-0.83
	virtual/perl-Test-Simple
		>=dev-perl/Class-Inspector-1.06
		dev-perl/Config-Tiny
	dev-lang/perl"
