#!/bin/bash

dir="$HOME/.config/bspwm/rofi"

choice="$(cat ~/.cache/networks | rofi -dmenu -p "Networks" -theme $dir/wifi_menu.rasi)"
ssid="$(echo $choice | awk '{print $1}')"

if [ ! -z "$ssid" ]; then
    password="$(rofi -i -dmenu -password -no-fixed-num-lines -p "Password: " -theme $dir/input.rasi)"
    [ -z "$password" ] || nmcli dev wifi connect $ssid password $password
fi

if ! pgrep -x nmcli > /dev/null; then
    echo "$(nmcli dev wifi list | sed 1,1d | cut -c 28-)" > "$HOME/.cache/networks"
fi
