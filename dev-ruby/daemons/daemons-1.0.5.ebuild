# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/daemons/daemons-1.0.5.ebuild,v 1.7 2007/07/29 19:07:46 dertobi123 Exp $

inherit ruby gems

USE_RUBY="ruby18"
DESCRIPTION="Wrap existing ruby scripts to be run as a daemon"
HOMEPAGE="http://daemons.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""
