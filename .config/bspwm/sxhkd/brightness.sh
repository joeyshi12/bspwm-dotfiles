#!/bin/bash

PRIMARY_MONITOR=HDMI-0
STEP=0.05

brightness=$(xrandr --verbose --current | grep "^${PRIMARY_MONITOR}" -A5 | tail -n1)
brightness=${brightness##* }

case $1 in
    +) brightness=$(echo "b=${brightness}+${STEP};if(b>=1) {1} else {b}" | bc);;
    -) brightness=$(echo "b=${brightness}-${STEP};if(b<=0) {0} else {b}" | bc);;
    *) exit 1;;
esac

xrandr --output "${PRIMARY_MONITOR}" --brightness "${brightness}"
       #--output "DVI-I-1" --brightness "${brightness}"
