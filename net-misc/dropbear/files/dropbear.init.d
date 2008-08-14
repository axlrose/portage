#!/sbin/runscript
# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/dropbear/files/dropbear.init.d,v 1.2 2004/07/14 23:57:35 agriffis Exp $

depend() {
	use logger dns
	need net
}

check_config() {
	if [ ! -e /etc/dropbear/ ] ; then
		mkdir /etc/dropbear/
	fi
	if [ ! -e /etc/dropbear/dropbear_dss_host_key ] ; then
		einfo "Generating DSS-Hostkey..."
		/usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key
	fi
	if [ ! -e /etc/dropbear/dropbear_rsa_host_key ] ; then
		einfo "Generating RSA-Hostkey..."
		/usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
	fi
}

start() {
	check_config || return 1
	ebegin "Starting dropbear"
	/usr/sbin/dropbear ${DROPBEAR_OPTS}
	eend $?
}

stop() {
	ebegin "Stopping dropbear"
	start-stop-daemon --stop --pidfile /var/run/dropbear.pid
	eend $?
}
