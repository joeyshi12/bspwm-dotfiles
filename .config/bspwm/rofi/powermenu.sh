#!/bin/bash

ROFI="${HOME}/.config/bspwm/rofi"

# Options
SHUTDOWN=" Shutdown"
REBOOT=" Restart"
LOCK=" Lock"
SUSPEND=" Sleep"
LOGOUT="  Logout"
OPTIONS="${LOCK}\n${SUSPEND}\n${LOGOUT}\n${REBOOT}\n${SHUTDOWN}"

# Confirmation
confirm_exit() {
    rofi -dmenu\
         -i\
         -no-fixed-num-lines\
         -p "Are you sure? [Y/n]: "\
         -theme "${ROFI}/input.rasi"
}

# Message
msg() {
    rofi -theme "${ROFI}/message.rasi"\
         -e "Available options  -  Y/n"
}

choice="$(echo -e "${OPTIONS}" | rofi -theme "${ROFI}/powermenu.rasi" -p "Catppuccin" -dmenu -selected-row 0)"
case "${choice}" in
    ${shutdown})
        case "$(confirm_exit &)" in
            y|Y) systemctl poweroff;;
            n|N) exit 0;;
            *) msg;;
        esac
        ;;
    ${reboot})
        case "$(confirm_exit &)" in
            y|Y) systemctl reboot;;
            n|N) exit 0;;
            *) msg;;
        esac
        ;;
    ${lock})
        if [[ -f /usr/bin/betterlockscreen ]]; then
            betterlockscreen -l blur
        elif [[ -f /usr/bin/i3lock ]]; then
            i3lock
        fi
        ;;
    ${suspend})
        case "$(confirm_exit &)" in
            y|Y) systemctl suspend;;
            n|N) exit 0;;
            *) msg;;
        esac
        ;;
    ${logout})
        case "$(confirm_exit &)" in
            y|Y) bspc quit;;
            n|N) exit 0;;
            *) msg;;
        esac
        ;;
esac
