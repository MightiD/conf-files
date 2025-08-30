#!/bin/bash

echo INSTALLING NECESSARY PACKAGES

sudo pacman -S hyprland hypridle hyprlock hyprshot wf-recorder swww waybar kitty dolphin wofi flatpak swaync pkgconf openssl inetutils samba zsh-autosuggestions zsh-syntax-highlighting

flatpak install io.github.ungoogled_software.ungoogled_chromium

#rust install for waybar music mod

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustup update
