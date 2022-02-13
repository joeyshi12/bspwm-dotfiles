#!/bin/bash

PRIMARY_MON="HDMI-0"    # Discover monitor name with: xrandr | grep " connected"
STEP=5          # Step Up/Down brightnes by: 5 = ".05", 10 = ".10", etc.

CurrBright=$( xrandr --verbose --current | grep ^"$PRIMARY_MON" -A5 | tail -n1 )
CurrBright="${CurrBright##* }"  # Get brightness level with decimal place

Left=${CurrBright%%"."*}        # Extract left of decimal point
Right=${CurrBright#*"."}        # Extract right of decimal point
Right=${Right:0:2}

MathBright="0"
[[ "$Left" != 0 ]] && MathBright="$Left"00          # 1.0 becomes "100"
[[ "${#Right}" -eq 1 ]] && Right="$Right"0          # 0.5 becomes "50"
MathBright=$(( MathBright + Right ))

[[ "$1" == "Up" || "$1" == "+" ]] && MathBright=$(( MathBright + STEP ))
[[ "$1" == "Down" || "$1" == "-" ]] && MathBright=$(( MathBright - STEP ))
[[ "${MathBright:0:1}" == "-" ]] && MathBright=0    # Negative not allowed
[[ "$MathBright" -gt 100  ]] && MathBright=100      # Can't go over 1.00

if [[ "${#MathBright}" -eq 3 ]]; then
    MathBright="$MathBright"000
    CurrBright="${MathBright:0:1}.${MathBright:1:2}"
elif [[ "${#MathBright}" -eq 2 ]]; then
    MathBright="$MathBright"000
    CurrBright=".${MathBright:0:2}"
else
    MathBright=0"$MathBright"
    CurrBright=".${MathBright:0:2}"
fi

xrandr --output "$PRIMARY_MON" --brightness "$CurrBright"
xrandr --output "DVI-I-1" --brightness "$CurrBright"

# Display current brightness
printf "Monitor $PRIMARY_MON "
echo $( xrandr --verbose --current | grep ^"$PRIMARY_MON" -A5 | tail -n1 )
