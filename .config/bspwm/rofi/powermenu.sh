#!/bin/bash

dir="~/.config/bspwm/rofi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout="  Logout"
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Confirmation
confirm_exit() {
    rofi -dmenu\
         -i\
         -no-fixed-num-lines\
         -p "Are you sure? [Y/n]: "\
         -theme "$dir/input.rasi"
}

# Message
msg() {
    rofi -theme "$dir/message.rasi"\
         -e "Available options  -  Y/n"
}

choice="$(echo -e "$options" | rofi -theme "$dir/powermenu.rasi" -p "Catppuccin" -dmenu -selected-row 0)"
case "$choice" in
    $shutdown)
        case "$(confirm_exit &)" in
            y|Y) systemctl poweroff;;
            n|N) exit 0;;
            *) msg;;
        esac
        ;;
    $reboot)
        case "$(confirm_exit &)" in
            y|Y) systemctl reboot;;
            n|N) exit 0;;
            *) msg;;
        esac
        ;;
    $lock)
        if [[ -f /usr/bin/betterlockscreen ]]; then
            betterlockscreen -l blur
        elif [[ -f /usr/bin/i3lock ]]; then
            i3lock
        fi
        ;;
    $suspend)
        case "$(confirm_exit &)" in
            y|Y)
                mpc -q pause
                amixer set Master mute
                systemctl suspend
                ;;
            n|N)
                exit 0
                ;;
            *)
                msg
                ;;
        esac
        ;;
    $logout)
        case "$(confirm_exit &)" in
            y|Y) bspc quit;;
            n|N) exit 0;;
            *) msg;;
        esac
        ;;
esac
