#!/bin/bash

STATUS=$(nmcli -g GENERAL.STATE c s MiniArchMain)

if [ "$STATUS" != "activated" ]; then
	nmcli connection up mini-arch-ovpn
else
	nmcli connection down mini-arch-ovpn
fi
