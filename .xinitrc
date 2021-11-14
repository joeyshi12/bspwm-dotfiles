xrdb -merge ~/.Xresources

xrandr --output DP-2 --mode 2560x1440 --primary \
       --output DVI-I-1 --mode 1920x1080 --right-of DP-2

exec dbus-launch bspwm
