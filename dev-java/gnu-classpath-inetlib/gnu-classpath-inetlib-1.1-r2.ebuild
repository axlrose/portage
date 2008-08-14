# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/gnu-classpath-inetlib/gnu-classpath-inetlib-1.1-r2.ebuild,v 1.6 2007/07/11 19:58:37 mr_bones_ Exp $

inherit java-pkg-2 java-ant-2

MY_PN="inetlib"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Network extensions library for GNU classpath and classpathx"
HOMEPAGE="http://www.gnu.org/software/classpath/"
SRC_URI="mirror://gnu/classpath/${MY_P}.tar.gz"
LICENSE="GPL-2-with-linking-exception"
SLOT="1.1"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="doc"
RDEPEND=">=virtual/jre-1.3
	>=dev-java/jessie-0.9.7
	>=dev-java/gnu-crypto-2.0.1
	"
DEPEND=">=virtual/jdk-1.3
	${RDEPEND}"
S="${WORKDIR}/${MY_PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-jdk15.patch"

	mkdir ext && cd ext
	java-pkg_jar-from jessie
	java-pkg_jar-from gnu-crypto
}

src_compile() {
	econf \
		--enable-smtp \
		--enable-imap \
		--enable-pop3 \
		--enable-nntp \
		--enable-ftp \
		--enable-gopher \
		--with-jsse-jar=${S}/ext \
		--with-javax-security-jar=${S}/ext \
		|| die
	# https://bugs.gentoo.org/show_bug.cgi?id=179897
	emake JAVACFLAGS="${JAVACFLAGS}" -j1 || die
	if use doc ; then
		emake -j1 javadoc || die
	fi
}

src_install() {
	einstall || die
	rm -rf ${D}/usr/share/java
	java-pkg_dojar inetlib.jar
	use doc && java-pkg_dojavadoc docs
	dodoc AUTHORS NEWS README || die
}
