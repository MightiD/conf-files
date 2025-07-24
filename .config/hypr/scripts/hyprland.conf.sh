#!/bin/bash

HOSTNAME=$(hostname)

case "$HOSTNAME" in
    Arch-Linux)
        ln -sf ~/.config/hypr/devices/hyprland.arch.conf ~/.config/hypr/devices/hyprland.base.conf
        echo E
        ;;
    mini-arch)
        ln -sf ~/.config/hypr/devices/hyprland.miniArch.conf ~/.config/hypr/devices/hyprland.base.conf
        ;;
esac