# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Class-ISA/Class-ISA-0.33.ebuild,v 1.1 2008/11/02 07:16:47 tove Exp $

inherit perl-module

DESCRIPTION="Report the search path thru an ISA tree"
SRC_URI="mirror://cpan/authors/id/S/SB/SBURKE/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~sburke"

LICENSE="Artistic"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE=""

SRC_TET="do"
SLOT="0"
DEPEND="dev-lang/perl"
