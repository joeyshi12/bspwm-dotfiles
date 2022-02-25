#!/usr/bin/env bash

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
			 -p "Are You Sure? : "\
			 -theme $dir/confirm.rasi
}

# Message
msg() {
	rofi -theme "$dir/message.rasi"\
		   -e "Available Options  -  y / n"
}

uptime=$(uptime -p | sed -e 's/up //g')
chosen="$(echo -e "$options" | rofi -theme "$dir/powermenu.rasi" -p "Uptime: $uptime" -dmenu -selected-row 0)"

case $chosen in
	$shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
    else
			msg
		fi
		;;
	$reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
		else
			msg
		fi
		;;
	$lock)
		if [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l blur
		elif [[ -f /usr/bin/i3lock ]]; then
			i3lock
		fi
		;;
	$suspend)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
		else
			msg
		fi
		;;
	$logout)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			bspc quit
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
		else
			msg
		fi
		;;
esac
