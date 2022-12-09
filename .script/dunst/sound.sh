#!/bin/bash
a=$(cat /home/navtey/.script/dunst/sound)
if [ $a == "1" ]
then


if [[ $1 == "xfce4-power-manager" ]]
then
exit
elif [[ $1 == "Package Manager" ]]
then
exit
elif [[ $4 == "user-idle" ]]
then
ffplay -nodisp -autoexit  ~/.script/2.mp3 
exit
elif [[ $1 == "KDE Connect" ]]
then
              if [[ $2 == "WhatsApp" ]]
              then
                ffplay -nodisp -autoexit  ~/.script/4.mp3
              elif [[ $2 == "Discord" ]] || [[ $2 == "Messages" ]] || [[ $2 == "MyJio" ]]
              then
                 exit
              else
                ffplay -nodisp -autoexit  ~/.script/1.mp3 
              fi


elif [[ $4 == "dialog-information" ]]
then
ffplay -nodisp -autoexit  ~/.script/5.mp3 
exit
else
ffplay -nodisp -autoexit  ~/.script/1.mp3 
fi




else 
echo $a 
fi
echo $1" 2> "$2" 3>"$3" 4>"$4 > /home/navtey/weird
