#!/bin/bash

DIR="$HOME/.config/bspwm/rofi"
NETWORKS_CACHE="$HOME/.cache/networks"

current_wifi=$(nmcli connection show --active | sed 1,1d | awk '{print $1}')
ssid="$(grep -v "$current_wifi" "$NETWORKS_CACHE" | rofi -dmenu -p "Networks" -theme "$DIR/wifi_menu.rasi" | awk '{print $1}')"

if [ ! -z "$ssid" ]; then
    password=$(rofi -i -dmenu -password -no-fixed-num-lines -p "Password: " -theme $DIR/input.rasi)
    if [ -z "$password" ]; then
        response="$(nmcli dev wifi connect $ssid)"
    else
        response="$(nmcli dev wifi connect $ssid password $password)"
    fi
    if [ -z "$(echo "$response" | grep -v "Error")" ]; then
        notify-send "Failed to connect to $ssid"
    else
        notify-send "Successfully connected to $ssid"
    fi
fi

if ! pgrep -x nmcli > /dev/null; then
    echo "$(nmcli dev wifi | grep -v "\*" | sed 1,1d | sed "s/^\s*[A-Z0-9:]*\s*//g")" > "$NETWORKS_CACHE"
fi
