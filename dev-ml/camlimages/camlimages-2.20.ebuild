# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ml/camlimages/camlimages-2.20.ebuild,v 1.7 2008/01/27 14:22:57 aballier Exp $

inherit findlib eutils

IUSE="gtk opengl"

DESCRIPTION="An image manipulation library for ocaml"
HOMEPAGE="http://pauillac.inria.fr/camlimages/"
SRC_URI="ftp://ftp.inria.fr/INRIA/caml-light/bazar-ocaml/${P/20/2}.tgz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 x86 ppc"

DEPEND=">=dev-lang/ocaml-3.08
	gtk? ( dev-ml/lablgtk )
	opengl? ( dev-ml/lablgl )
	media-libs/giflib
	media-libs/libpng
	media-libs/jpeg
	media-libs/tiff
	x11-libs/libXpm
	>=media-libs/freetype-2
	virtual/ghostscript"

MY_S="${WORKDIR}/${P/20/2}"

pkg_setup() {
	if ! built_with_use --missing true dev-lang/ocaml ocamlopt; then
		eerror "${PN} needs to be built with native code support from ocaml"
		eerror "You first need to have a native code ocaml compiler."
		eerror "You need to install dev-lang/ocaml with ocamlopt useflag on."
		die "Please install ocaml with ocamlopt useflag"
	fi
}

src_unpack() {
	unpack ${A}
	cd ${MY_S}
	if has_version ">=dev-lang/ocaml-3.09";
	then
		epatch "${FILESDIR}/${P}-ocaml-3.09.diff"
	fi
}

src_compile() {
	local myconf

	cd ${MY_S}
	if !(use gtk);
	then
		myconf="--with-lablgtk=/dev/null --with-lablgtk2=/dev/null"
	fi

	if !(use opengl);
	then
		myconf="$myconf --with-lablgl=/dev/null"
	fi

	econf ${myconf} || die
	emake -j1 || die
	emake -j1 opt || die
}

src_test() {
	cd ${MY_S}/test
	make
	./test
	./test.byt
}

src_install() {
	# Use findlib to install properly, especially to avoid
	# the shared library mess
	findlib_src_preinst
	mkdir "${T}/tmp"
	cd ${MY_S}
	make CAMLDIR="${T}/tmp" \
		LIBDIR="${T}/tmp" \
		DESTDIR="${T}/tmp" \
		install || die
	sed -e "s/VERSION/${PV}/" "${FILESDIR}/META" > "${T}/tmp/META"

	ocamlfind install camlimages "${T}"/tmp/*
}
