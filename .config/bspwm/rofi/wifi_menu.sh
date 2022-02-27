#!/bin/bash

dir="$HOME/.config/bspwm/rofi"

choice="$(cat ~/.cache/networks | rofi -dmenu -p "Networks" -theme $dir/wifi_menu.rasi)"
ssid="$(echo $choice | cut -d" " -f1)"

if [ ! -z $ssid ]; then
    password="$(rofi -i -dmenu -password -no-fixed-num-lines -p "Password: " -theme $dir/input.rasi)"
    nmcli dev wifi connect $ssid password $password
fi

echo "$(nmcli dev wifi list | sed 1,1d | cut -c 28-)" > "$HOME/.cache/networks"
