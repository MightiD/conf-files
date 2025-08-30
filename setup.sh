#!/bin/bash

# IMPORTANT PACKAGES
echo "INSTALLING NECESSARY PACKAGES"

sudo pacman -Syy

sudo pacman -S hyprland hypridle hyprlock hyprshot wf-recorder swww waybar kitty dolphin wofi flatpak swaync pkgconf openssl inetutils samba zsh-autosuggestions zsh-syntax-highlighting eza power-profiles-daemon python-pillow ttf-firacode-nerd

flatpak install io.github.ungoogled_software.ungoogled_chromium

#rust install for waybar music mod

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustup update

export PATH="$HOME/.cargo/bin:$PATH"

# MINEGRUB THEME
echo CONFIGURING GRUB THEME

git clone https://github.com/Lxtharia/minegrub-theme.git

cd minegrub-theme

cp "./background_options/1.18 - [Caves And Cliffs 2].png" ./minegrub/backgrounds/

sudo cp -ruv ./minegrub /boot/grub/themes/

sudo echo "GRUB_THEME=/boot/grub/themes/minegrub/theme.txt" | sudo tee -a /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo mkdir -p /etc/pacman.d/hooks

sudo cp ./templates/minegrub.hook /etc/pacman.d/hooks/minegrub.hook

cd ..
rm -rf minegrub-theme

# PACMAN CONF
echo CONFIGURING PACMAN

sudo cp ./templates/pacman.conf /etc/pacman.conf

sudo pacman -Syy


# WAYBAR MODULE
echo BUILDING WAYBAR MUSIC MODULE

git clone https://github.com/Andeskjerf/waybar-module-music.git
cd waybar-module-music
cargo build --release

mkdir -p ~/.local/bin

cp target/release/waybar-module-music ~/.local/bin/

cd ..
rm -rf waybar-module-music


python setup.py