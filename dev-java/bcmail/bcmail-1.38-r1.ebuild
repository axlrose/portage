# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/bcmail/bcmail-1.38-r1.ebuild,v 1.5 2008/02/15 18:45:39 wltjr Exp $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_P="${PN}-jdk14-${PV/./}"
DESCRIPTION="Java cryptography APIs"
HOMEPAGE="http://www.bouncycastle.org/java.html"
SRC_URI="http://www.bouncycastle.org/download/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"

COMMON_DEPEND="~dev-java/bcprov-${PV}
		=dev-java/junit-3.8*
		dev-java/sun-jaf
		java-virtuals/javamail"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	${COMMON_DEPEND}"
RDEPEND=">=virtual/jre-1.4
	${COMMON_DEPEND}"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	unpack ./src.zip
}

src_compile() {
	mkdir "${S}/classes"

	find org -name "*.java" > "${T}/src.list"
	ejavac -d "${S}/classes" \
		-classpath $(java-pkg_getjars bcprov,junit,sun-jaf,javamail) \
		"@${T}/src.list"

	cd "${S}/classes"
	jar -cf "${S}/${PN}.jar" * || die "failed to create jar"
}

src_install() {
	java-pkg_dojar "${S}/${PN}.jar"

	use source && java-pkg_dosrc org
	use doc && java-pkg_dojavadoc docs
}
