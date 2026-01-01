#!/bin/bash

# PACMAN
echo CONFIGURING PACMAN

sudo cp ./templates/pacman.conf /etc/pacman.conf

sudo pacman -Syy

echo "INSTALLING NECESSARY PACKAGES"

sudo pacman -S hyprland hypridle hyprlock hyprshot wf-recorder swww waybar kitty dolphin wofi flatpak swaync pkgconf openssl inetutils samba eza power-profiles-daemon python-pillow ttf-firacode-nerd ttf-font-awesome ttf-jetbrains-mono noto-fonts noto-fonts-emoji pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol breeze breeze-gtk xdg-desktop-portal-gtk nwg-look ttf-hack kvantum breeze-icons breeze5 libreoffice-still openssh qt5ct qt6ct gnome-tweaks base-devel git


# YAY
echo YAY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


#BROWSER
yay -S ungoogled-chromium-bin --noconfirm


# RUST
echo INSTALLING RUST
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustup update

export PATH="$HOME/.cargo/bin:$PATH"


# SSH
sudo systemctl enable sshd
sudo systemctl start sshd


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


# HYPRLAND-SCROLLING
echo HYPRLAND SCROLLING
git clone https://github.com/mightid/hyprland-scrolling.git
cd hyprland-scrolling
cargo build --release
cp target/release/hyprland-scrolling ~/.local/bin
cd ..
rm -rf hyprland-scrolling


# FONTS
echo TERMINAL FONTS
mkdir =p ~/.local/share/fonts
wget -O ~/.local/share/fonts/Miracode.ttf \
    https://github.com/IdreesInc/Miracode/releases/download/v1.0/Miracode.ttf
fc-cache -fv


# SYM-LINKS SETUP
echo SYM-LINKS
python setup.py


# ZSH PLUGINS
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
