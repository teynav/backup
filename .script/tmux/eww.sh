#!/bin/zsh
#echo WEEEW
a=""
if [ "$(acpi | grep Discharging )" != "" ]
then
        c=$(acpi | grep Discharging |sed "s/^.*g,//g" | sed "s/,.*$//g")
	echo "$c D"
elif  [ "$(acpi | grep Full )" != "" ]
then
	echo " 🔋 "
else
        c=$(acpi | grep Charging |sed "s/^.*g,//g" | sed "s/,.*$//g")
	echo "$c C"
fi

# 🌕'
#set -g @batt_icon_charge_tier7 '🌖'
#set -g @batt_icon_charge_tier6 '🌖'
#set -g @batt_icon_charge_tier5 '🌗'
#set -g @batt_icon_charge_tier4 '🌗'
#set -g @batt_icon_charge_tier3 '🌘'
#set -g @batt_icon_charge_tier2 '🌘'
#set -g @batt_icon_charge_tier1 '🌑'
#set -g @batt_icon_status_charged '🔋'
#set -g @batt_icon_status_charging '⚡'
#set -g @batt_icon_status_discharging '👎'
