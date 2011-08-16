# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/doctrine/doctrine-1.2.4.ebuild,v 1.1 2011/03/21 07:17:24 olemarkus Exp $

EAPI="2"
SLOT=get_major_version

PHP_LIB_NAME="Doctrine"

inherit php-lib-r1

MY_PV="DoctrineORM-${PV}-full"
DESCRIPTION="An object relational mapper for PHP5"
HOMEPAGE="http://www.doctrine-project.org/"
SRC_URI="http://www.doctrine-project.org/downloads/${MY_PV}.tar.gz"

LICENSE="LGPL-2.1 MIT BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cli"

DEPEND=">=dev-lang/php-5.3.0[cli,pdo]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PV}"

src_install() {
	if use cli ; then
		insinto /usr/bin
		doins doctrine-orm/bin/doctrine.php
		dobin doctrine-orm/bin/doctrine
	fi
	php-lib-r1_src_install doctrine-orm/Doctrine $(cd doctrine-orm/Doctrine ; find . -type f -print)
}
