#!/bin/bash
rn=$(cat study)
p="/home/navtey/Pictures/"
if [[ $rn == "1" ]]
then
	p="/home/navtey/Pictures/Study/"
	echo Study mode
	echo $p""$(date +'screenshot_%Y-%m-%d-%H%M%S.png') 
else
	echo Weird mode
fi
if [[ $1 == "1" ]]
then
    grim -g "$(slurp)" $p""$(date +'screenshot_%Y-%m-%d-%H%M%S.png') &&  notify-send "Screenshot taken Senpai" && ~/.script/copy
else
    grim  $p""$(date +'screenshot_%Y-%m-%d-%H%M%S.png') && notify-send "Screenshot taken Senpai" && ~/.script/copy
fi
