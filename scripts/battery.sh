echo Internal Battery:
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'state|to full|percentage'
echo External Battery:
upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E 'state|to full|percentage'
