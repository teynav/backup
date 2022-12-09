#!/bin/bash
rn=$(cat study)
if [[ $rn == "1" ]]
then
	echo 2 > study
	notify-send "Study mode disabled"
else
	echo 1 > study
	notify-send "Study mode enabled"
fi
