xrdb -merge ~/.Xresources

xrandr --output HDMI-0 --mode 2560x1440 --primary \
       --output DVI-I-1 --mode 1920x1080 --right-of HDMI-0

exec dbus-launch bspwm
