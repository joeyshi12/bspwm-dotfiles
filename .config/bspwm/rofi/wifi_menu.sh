#!/bin/bash

# TODO: create stylesheet + finish implementation
choice="$(cat ~/.cache/networks | rofi -dmenu)"
choice="$(echo $choice | cut -d" " -f2)"

if [ ! -z $choice ]; then
    password="$(rofi -p "Password: " -dmenu)"
    nmcli dev wifi connect $choice password $password
    nmcli dev wifi > ~/.cache/networks
fi
