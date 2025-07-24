#!/bin/bash

HOSTNAME=$(hostname)

case "$HOSTNAME" in
    Arch-Linux)
        ln -sf ~/.config/hypr/devices/hyprland.arch.conf ~/.config/hypr/devices/hyprland.base.conf
	echo Main arch
        ;;
    mini-arch)
        ln -sf ~/.config/hypr/devices/hyprland.miniArch.conf ~/.config/hypr/devices/hyprland.base.conf
        echo Mini Arch
	;;
esac
