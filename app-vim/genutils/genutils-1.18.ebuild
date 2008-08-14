# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/genutils/genutils-1.18.ebuild,v 1.7 2006/01/24 17:20:09 chutzpah Exp $

inherit vim-plugin

DESCRIPTION="vim plugin: library with various useful functions"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=197"
LICENSE="GPL-2"
KEYWORDS="alpha amd64 ia64 mips ppc sparc x86"
IUSE=""

RDEPEND=">=app-vim/multvals-3.10"

VIM_PLUGIN_HELPTEXT=\
"This plugin provides library functions and is not intended to be used
directly by the user."
