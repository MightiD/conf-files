#!/bin/bash

git clone https://github.com/Lxtharia/minegrub-theme.git

cd minegrub-theme

cp ./background_options/1.18\ -\ \[Caves And Cliffs 2\].png ./minegrub/backgrounds/


sudo cp -ruv ./minegrub /boot/grub/themes/

sudo echo "GRUB_THEME=/boot/grub/themes/minegrub/theme.txt" >> /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

touch /etc/pacman.d/hooks/minegrub.hook

cat > /etc/pacman.d/hooks/minegrub.hook <<'EOF'
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = *

[Action]
Description = Updating MineGRUB Theme
When = PostTransaction
Exec = /usr/bin/python3 /boot/grub/themes/minegrub/update_theme.py
EOF
