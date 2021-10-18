#!/bin/bash

# Notifications
killall dunst

# Monitor settings
xrandr --output HDMI-1-1 --primary --mode 2560x1440 --output DVI-I-1 --mode 1920x1080 --right-of HDMI-1-1

# Keyboard shortcuts
sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

# Polybar
~/.config/bspwm/polybar/launch.sh

# Restore cursor theme
xsetroot -cursor_name left_ptr &

# Restore wallpaper
feh --bg-fill ~/.config/bspwm/wallpapers/aurora.jpg

# Compositor
/usr/local/bin/picom --experimental-backends --config ~/.config/bspwm/picom/picom.conf

