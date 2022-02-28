#!/bin/bash

DIR="$HOME/.config/bspwm/rofi"
NETWORKS_CACHE="$HOME/.cache/networks"

choice="$(cat "$NETWORKS_CACHE" | rofi -dmenu -p "Networks" -theme $DIR/wifi_menu.rasi)"
bssid="$(echo $choice | awk '{print $1}')"

if [ ! -z "$bssid" ]; then
    password="$(rofi -i -dmenu -password -no-fixed-num-lines -p "Password: " -theme $DIR/input.rasi)"
    [ -z "$password" ] || nmcli dev wifi connect $bssid password $password
fi

if ! pgrep -x nmcli > /dev/null; then
    nmcli dev wifi | grep -v "\*" | sed 1,1d | sed "s/^\s*[A-Z0-9:]*\s*//g" > "$NETWORKS_CACHE"
fi
