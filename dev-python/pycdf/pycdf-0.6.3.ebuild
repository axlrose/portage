# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pycdf/pycdf-0.6.3.ebuild,v 1.1 2007/06/14 14:10:47 lucass Exp $

inherit distutils

MY_P=${PN}-${PV:0:3}-${PV:4:1}

DESCRIPTION="Python interface to scientific netCDF library."
HOMEPAGE="http://pysclint.sourceforge.net/pycdf/"
SRC_URI="mirror://sourceforge/pysclint/${MY_P}.tar.gz"

IUSE="examples"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86"
LICENSE="PYTHON"

DEPEND=">=sci-libs/netcdf-3.6.1
	dev-python/numpy"

S="${WORKDIR}/${MY_P}"

src_install() {
	distutils_src_install

	dohtml doc/pycdf.html
	dodoc CHANGES doc/pycdf.txt

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
