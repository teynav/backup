#!/bin/bash 
a=$(pw-cli list-objects | grep -i PipeWire:Interface:Port | grep -Eo "^.*[0-9]*," | sed "s/id//g" | sed "s/,//g" )
echo $a
SAVEIFS=$IFS   # Save current IFS
IFS=$'\n'      # Change IFS to new line
a=($a) # split to array $names
IFS=$SAVEIFS   # Restore IFS
echo ${a[3]} 
for i in ${a[@]}
do
	d=$(pw-cli info $i)
	pw-cli info $i
	is_fl=$(echo $d | grep playback_FL)
	is_fr=$(echo $d | grep playback_FR)
	is_out=$(echo $d | grep "port.direction = \"out\"")
	is_physical=$(echo $d | grep "port.physical = \"true\"")

	if [[ $is_fl != "" ]];
	then
		echo "This is Front Left"
	elif [[ $is_fr != "" ]];
	then
		echo "This is Front Right"
	else
		echo "Neither Front left or Front Right"
	fi 

	if [[ $is_out != "" ]];
	then
     echo "This leads out "
	fi 

	if [[ $is_physical != "" ]];
	then 
		echo "This is physical port"
	fi 
read x
done

