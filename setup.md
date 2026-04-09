### List of packages for installation:

#### Pacman:
```sh
linux linux-headers linux-firmware base-devel git openssl pkgconf cpio sof-firmware

efibootmgr grub dosfstools ntfs-3g dimdecode tree man-db man-pages arch-install-scripts

hyprland hypridle hyprlock hyprshot xdg-desktop-portal-hyprland qt5-wayland qt6-wayland ly

waybar wofi fuzzel swaync

7zip unrar unzip

cups cups-pdf ghostscript

kitty nvim tmux eza stow

dolphin superfile nsxiv mpv wf-recorder

pipewire pipewire-alsa pipewire-pulse pipewire-jack

breeze breeze-gtk breeze-icons kvantum nwg-look xorg-xrdb ttf-firacode-nerd awww

xdg-desktop-portal-gtk flatpak

networkmanager openssh inetutils samba

docker docker-compose  
```

#### AUR:
```sh
qt6ct-kde
ttf-miracode
waybar-module-music
ungoogled-chromium-bin
```

### AUR Installation:
```sh
mkdir gitClones
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Pacman Configurations:
In `/etc/pacman.conf`under `[options]` add:
```
Color
ILoveCandy
```
and uncommend the `[multilib]` repository

### Rust:
```sh
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustup update
```

### SSH:
```sh
sudo systemctl enable --now sshd
```

### Hyprland Plugins:
```sh
hyprpm update
hyprpm add https://github.com/shezdy/hyprsplit
hyprpm enable hyprsplit
```

### ZSH plugins:
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Theming:
`~/.config/gtk3.0/settings.ini`: `theme=Breeze-Dark`
`~/.config/gtk4.0/settings.ini`: `gtk-application-prefer-dark-theme=1`
```sh
systemctl --user import-environment GTK_THEME GTK_APPLICATION_PREFER_DARK_THEME
```
For QT use `qt6ct-kde` from the AUR

### NSXIV:
```sh
xrdb ~/.Xresources
```

### Dotfiles:
```sh
stow */        # for everything
stow {package} # for a specific package
```

### Ungoogled-chromium:
Download the chrome `.deb` image from [here](https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb)
```sh
ar x google-chrome-stable-current_amd64.deb
tar -xvf data.tar.xz
cd ./opt/google/chrome/WidevineCdm
sudo cp -r ./ /usr/lib/chromium/WidevineCdm
```
enable widevine with `--enable-widevine`
#### Set as default:
##### Set:
```sh
xdg-settings set default-web-browser chromium.desktop
xdg-mime default chromium.desktop x-scheme-handler/http
xdg-mime default chromium.desktop x-scheme-handler/https
xdg-mime default chromium.desktop application/pdf
```

##### Verify:
```sh
xdg-settings get default-web-browser
xdg-mime query default x-scheme-handler/http
xdg-mime query default x-scheme-handler/https
xdg-mime query default application/pdf
```

#### Web RTC fix:
Go to `chrome://flags/#webrtc-ip-handling-policy`  
Set from `Disable non proxied udp` to `Default`


### Windows Boot Entry:
The windows partition UUID can be found with `lsblk -f`
`/etc/grub.d/40_custom`
```
#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.

menuentry "Windows" {
    insmod part_gpt
    insmod fat
    insmod search_fs_uuid
    insmod chain

    search --fs-uuid --no-floppy --set=root {WINDOWS PART UUID}
    chainloader (${root})/EFI/Microsoft/Boot/bootmgfw.efi
}
```
