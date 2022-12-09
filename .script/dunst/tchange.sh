#!/bin/bash
a=$(cat /home/navtey/.script/dunst/sound)
if [ $a == "1" ]
then
echo 2 > /home/navtey/.script/dunst/sound
else 
echo 1 > /home/navtey/.script/dunst/sound
fi
