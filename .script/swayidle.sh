#!/bin/sh
swayidle -w \
     timeout 10 'swaylock -f -i ~/3.jpg' resume 'notify-send Hey112' \
     timeout 20 'swaymsg "output * dpms off"'\
         resume 'swaymsg "output * dpms on"'\
     lock 'swaylock -f -i ~/3.jpg' \
     before-sleep 'swaylock -f -i ~/3.jpg'

