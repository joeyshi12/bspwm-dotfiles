#!/bin/bash

# $1 is the desktop number of the current desktop
if [ $1 -gt 3 ]; then
    left_monitor_target=$(($1 - 3))
    bspc desktop -f ^$left_monitor_target
    bspc desktop -f ^$1
else
    right_monitor_target=$(($1 + 3))
    bspc desktop -f ^$right_monitor_target
    bspc desktop -f ^$1
fi
