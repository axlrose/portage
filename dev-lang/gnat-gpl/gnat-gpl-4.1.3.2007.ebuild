# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/gnat-gpl/gnat-gpl-4.1.3.2007.ebuild,v 1.8 2008/07/06 13:14:23 george Exp $

inherit gnatbuild

DESCRIPTION="GNAT Ada Compiler - AdaCore GPL version"
HOMEPAGE="https://libre.adacore.com/"
LICENSE="GPL-2"

SRC_URI="mirror://gentoo/gcc-branch-${GCCVER}.tar.bz2
	http://www.adaic.org/standards/05rm/RM-05-Html.zip
	mirror://gentoo/${P}.tar.bz2
	x86?   ( mirror://gentoo/gnatboot-${BOOT_SLOT}-i386.tar.bz2 )
	ppc?   ( mirror://gentoo/gnatboot-${BOOT_SLOT}-ppc.tar.bz2 )
	amd64? ( mirror://gentoo/gnatboot-${BOOT_SLOT}-amd64.tar.bz2 )"
# ${BOOT_SLOT} and ${GCCVER} are defined in gnatbuild.eclass and depend
# only on $PV, so should be safe to use in DEPEND/SRC_URI
#	mirror://gentoo/${PN}-gcc-3.4.6.1.diff.bz2

KEYWORDS="amd64 ppc x86"
DEPEND="app-arch/unzip"
RDEPEND=""

QA_EXECSTACK="${BINPATH:1}/gnatls ${BINPATH:1}/gnatbind
	${BINPATH:1}/gnatmake ${LIBEXECPATH:1}/gnat1
	${LIBPATH:1}/adalib/libgnat-2007.so
	${LIBPATH:1}/libffi.so.4.0.1 ${LIBPATH:1}/32/libffi.so.4.0.1 "

GNATSOURCE="${WORKDIR}/${PN}-2007-src"

src_unpack() {
	gnatbuild_src_unpack base_unpack common_prep

	# one of the converted gcc->gnatgcc in common_prep needs to stay gcc in
	# fact in this version
	sed -i -e 's:(Last3 = "gnatgcc"):(Last3 = "gcc"):' "${S}"/gcc/ada/makegpr.adb
	# reverting similar conversion in comment - line too long
	sed -i -e 's:"gnatgcc":"gcc":' "${S}"/gcc/ada/osint.ads
}

src_install() {
	gnatbuild_src_install

	# docs have to be fetched from 3rd place, quite messy package
	dodir /usr/share/doc/${PF}/html
	dohtml "${WORKDIR}"/*.html

	# misc notes and examples
	cd ${GNATSOURCE}
	dodoc features* known-problems-601
	cp -pPR examples/ Contributors.html "${D}/usr/share/doc/${PF}/"

	# this version of gnat does not provide info files yet
	rm -rf "${D}${DATAPATH}/info/"
}

pkg_postinst() {
	gnatbuild_pkg_postinst

	ewarn "Please note!!!"
	ewarn "gnat-gpl is distributed under the GPL-2 license, without the GMGPL provision!!"
	ewarn "For the GMGPL version you may look at the gnat-gcc compiler."
	ewarn
}
