# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/perl-Archive-Tar/perl-Archive-Tar-1.38.ebuild,v 1.3 2008/11/04 10:07:37 vapier Exp $

DESCRIPTION="A Perl module for creation and manipulation of tar files"
HOMEPAGE="http://www.gentoo.org/proj/en/perl/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ~ppc ~ppc64 s390 sh sparc ~sparc-fbsd x86 ~x86-fbsd"

IUSE=""
DEPEND=""

RDEPEND="|| ( ~dev-lang/perl-5.10.0 ~perl-core/Archive-Tar-${PV} )"
