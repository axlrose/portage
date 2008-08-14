# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/noweb/noweb-2.9-r5.ebuild,v 1.2 2008/05/12 11:22:11 aballier Exp $

inherit eutils

S=${WORKDIR}/src
#SRC_URI="ftp://ftp.dante.de/tex-archive/web/noweb/src.tar.gz"
SRC_URI="http://www.ibiblio.org/pub/Linux/distributions/gentoo/distfiles/noweb-src-${PV}.tar.gz"
HOMEPAGE="http://www.eecs.harvard.edu/~nr/noweb/"
LICENSE="freedist"
DESCRIPTION="a literate programming tool, lighter than web"

SLOT="0"
IUSE=""
KEYWORDS="x86 ppc sparc alpha amd64"

DEPEND="sys-devel/gcc
	virtual/tex-base
	sys-apps/gawk
	sys-apps/debianutils"

src_unpack() {

	unpack ${A} ; cd ${S}

	epatch ${FILESDIR}/${P}-security.patch
	epatch ${FILESDIR}/${P}-gentoo.diff

	# make touch only touches the files required, not the whole
	# tree as with find . -type f | xargs touch <obz@gentoo.org>
	#make touch

}

src_compile() {
	# noweb tries to use notangle and noweb; see bug #50429
	( cd c; emake CFLAGS="${CFLAGS}" LIBSRC="awk" ) || die
	export PATH="${PATH}:${T}"
	emake BIN=${T} LIB=${T} LIBSRC="awk" install-code \
		|| die "make temporal install failed."

	emake CFLAGS="${CFLAGS}" LIBSRC="awk" || die
}

src_install () {
	make DESTDIR=${D} LIBSRC="awk" install || die
	[ -x /usr/bin/nawk ] || dosym /usr/bin/gawk /usr/bin/nawk

	# fix man pages to be LFH compliant
	mv ${D}/usr/man ${D}/usr/share
}

pkg_postinst() {
	einfo "Running texhash to complete installation.."
	addwrite "/var/lib/texmf"
	addwrite "/usr/share/texmf"
	addwrite "/var/cache/fonts"
	texhash
}
