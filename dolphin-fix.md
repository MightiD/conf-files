# Dolphin fix for hyprland

### Update MIME databases
```sh
sudo update-mime-database /usr/share/mime
```

### Clear KDE cache
```sh
rm ~/.cache/ksycoca6_*
```
log out and back in to your desktop session

### Check if applications menu exists
```sh
ls /etc/xdg/menus/applications.menu
```
if not, run:
```sh
ls -l /etc/xdg/menus
```
```sh
sudo ln -s /etc/xdg/menus/plasma-applications.menu /etc/xdg/menus/applications.menu
rm ~/.cache/ksycoca6_*
kbuildsycoca6 --noincremental --track menu
killall dolphin
```
### Edit the mime types for dolphin
`~/.config/mimeapps.list`
