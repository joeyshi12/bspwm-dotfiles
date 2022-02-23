#!/bin/bash

killall -q polybar sxhkd dunst
wmname LG3D # Fixes problems with JDK versions assuming a reparenting window manager

# Restore wallpaper
feh --bg-fill "$HOME/.config/bspwm/wallpapers/blue_unicat.png" &

# Set display preferences
#xset s off
#xset -dpms
xset s blank
xset s 1800 # blank screen when inactive for 30 minutes

# Restore cursor theme
xsetroot -cursor_name left_ptr &

# Email client
pgrep -x thunderbird > /dev/null || thunderbird &

# Polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -q main -c "$HOME/.config/bspwm/polybar/config.ini" &
done

# Keyboard shortcuts
while pgrep -u $UID -x sxhkd > /dev/null; do sleep 0.1; done
sxhkd -c "$HOME/.config/bspwm/sxhkd/sxhkdrc" &

# Notifications daemon
while pgrep -u $UID -x dunst > /dev/null; do sleep 0.1; done
dunst -conf "$HOME/.config/bspwm/dunst/dunstrc" &

# Compositor
pgrep -x picom > /dev/null || picom &
