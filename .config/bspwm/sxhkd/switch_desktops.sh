#!/bin/bash

# Switches to the $1-th desktop across each monitor and stays focused on current monitor
left_target=$1
right_target=$(($1 + 3))
focused_desktop=$(bspc query -D -d focused --names)

if [[ "${focused_desktop}" -gt 3 ]]; then
    bspc desktop -f "^${left_target}"
    bspc desktop -f "^${right_target}"
else
    bspc desktop -f "^${right_target}"
    bspc desktop -f "^${left_target}"
fi

