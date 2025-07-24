#!/bin/bash

STATUS=$(nmcli -g GENERAL.STATE c s MiniArchMain) 

if [ "$STATUS" != "activated" ]; then
	nmcli connection up MiniArchMain
else
	nmcli connection down MiniArchMain
fi
