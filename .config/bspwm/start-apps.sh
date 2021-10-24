#!/bin/bash

# Restore wallpaper
feh --bg-fill ~/.config/bspwm/wallpapers/aurora.jpg

# Restore cursor theme
xsetroot -cursor_name left_ptr &

# Polybar
~/.config/bspwm/polybar/launch.sh

# Keyboard shortcuts
sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# Restart notifications daemon
killall dunst

# Open email + calendar
if [[ -z $(pidof thunderbird) ]]; then
    thunderbird &
fi

if [[ -z $(pidof gnome-calendar) ]]; then
    gnome-calendar &
fi

# Compositor
/usr/local/bin/picom --experimental-backends --config ~/.config/bspwm/picom/picom.conf
