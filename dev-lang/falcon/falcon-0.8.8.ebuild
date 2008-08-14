# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/falcon/falcon-0.8.8.ebuild,v 1.1 2008/01/21 07:15:50 omp Exp $

MY_P=${P/f/F}

DESCRIPTION="An open source general purpose untyped language written in C++"
HOMEPAGE="http://falconpl.org/"
SRC_URI="http://falconpl.org/downloads/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libpcre
	sys-libs/zlib"
DEPEND="${RDEPEND}
	dev-util/cmake"

S=${WORKDIR}/${MY_P}

src_compile() {
	./build.sh -p "${D}usr" -f "/usr" || die "build.sh failed"
}

src_test() {
	FALCON_LOAD_PATH=".;${S}/devel/release/build/core/rtl" \
		"${S}/devel/release/build/core/clt/faltest/faltest" \
		-d "${S}/core/tests/testsuite" \
		|| die "faltest failed"
}

src_install() {
	./build.sh -i || die "build.sh -i failed"
	dodoc AUTHORS ChangeLog README RELNOTES
}
