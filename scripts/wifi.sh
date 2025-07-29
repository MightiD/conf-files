#!/bin/bash

case $1 in
    disconnect)
        nmcli device disconnect wlp3s0
        ;;
    list)
        nmcli -f SSID,SIGNAL,BARS,RATE,CHAN,SECURITY,BSSID device wifi list --rescan yes
        ;;
    delete)
        nmcli connection delete $1
        ;;
    *)
        nmcli device wifi connect $1 --ask
esac
