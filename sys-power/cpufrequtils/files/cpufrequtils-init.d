#!/sbin/runscript
# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-power/cpufrequtils/files/cpufrequtils-init.d,v 1.3 2008/08/11 17:46:54 armin76 Exp $

checkconfig() {
	if [ -z "${GOVERNOR}" ]; then
		eerror "No governor set in /etc/conf.d/cpufrequtils"
		return 1
	fi
	if [ -z "${RESTORED_GOVERNOR}" ]; then
		eerror "Set the RESTORED_GOVERNOR value in /etc/conf.d/cpufrequtils"
		return 1
	fi
}


affect_change() {
	if [ "$#" != "2" ]; then
		eerror "affect_change called in correctly, need two args, action, and governor"
		return 1
	fi
	local cpu n

	for cpu in /sys/devices/system/cpu/cpu[0-9]*; do
		n=${cpu##*cpu}

		ebegin "${1} ${2} cpufreq governor on CPU${n}"
		cpufreq-set -c ${n} -g "${2}"
		eend ${?}
	done
}


start() {
	checkconfig || return 1
	affect_change "Enabling" "${GOVERNOR}"
}

stop() {
	checkconfig || return 1
	affect_change "Enabling" "${RESTORED_GOVERNOR}"
}
