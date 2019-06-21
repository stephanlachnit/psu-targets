#!/bin/sh

if `cat /sys/class/power_supply/A*/online | grep -q 1`; then
	echo "target: power adapter"
	systemctl stop psu-bat.target
	systemctl start psu-adp.target
else
	echo "target: battery"
	systemctl stop psu-adp.target
	systemctl start psu-bat.target
fi
