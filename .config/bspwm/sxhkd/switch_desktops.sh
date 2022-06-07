#!/bin/bash

# Switches to the $1-th desktop across each monitor and stays focused on current monitor
num_desktops_left=$(bspc query -m "HDMI-0" -D | wc -l)

left_target=$1
right_target=$(($left_target + $num_desktops_left))
focused_desktop=$(bspc query -D -d focused --names)

if [[ "${focused_desktop}" -gt "${num_desktops_left}" ]]; then
    bspc desktop -f "^${left_target}"
    bspc desktop -f "^${right_target}"
else
    bspc desktop -f "^${right_target}"
    bspc desktop -f "^${left_target}"
fi

