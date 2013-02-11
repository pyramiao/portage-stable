# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/elfio/elfio-1.0.3.ebuild,v 1.2 2009/03/04 17:19:25 drizzt Exp $

inherit eutils autotools

MY_P=ELFIO-${PV}
DESCRIPTION="ELF (Executable and Linkable Format) reader and producer implemented as a C++ library."
HOMEPAGE="http://elfio.sourceforge.net/"
SRC_URI="mirror://sourceforge/elfio/${MY_P}.tar.gz"

S="${WORKDIR}"/${MY_P}

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}"/${P}-shared.patch
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS NEWS README
}