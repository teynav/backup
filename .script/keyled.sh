#!/bin/bash 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $DIR
RED=0
GREEN=0
BLUE=0
COLOR=0 
MODE=0
MODE_SET=0 
SPEED=0
SPEED_SET=0 
PERMANENT=1

#a=$(zenity --forms --add-entry="Red" --add-entry="Blue" --add-entry="Green" --add-combo="Preset" --combo-values="Pink|Blue|Voilet|Green|Red|Yellow|White|Pink-D|Blue-D|Voilet-D|Green-D|Red-D|Yellow-D" --add-combo="Modes" --combo-values="Static|Breathing|Cycle|Strobe" --add-combo="Speed" --combo-values="Low|Medium|High" )
#echo $a

cd ~/.prog/faustus/
make
sudo rmmod asus_nb_wmi
sudo insmod src/faustus.ko

a="Blue|Static"
# a="Blue|Strobe|High"
SAVEIFS=$IFS && IFS=$'|' && a=($a) ; IFS=$SAVEIFS
echo $a 
for i in ${a[@]}
do
	if [[ "$i" == "Static" ]];
	then
		MODE=0
  elif [[ "$i" == "Pink" ]];
	then
		RED=bd
		GREEN=70
		BLUE=b0
		COLOR=1 
	elif [[ "$i" == "Blue" ]];
	then
		RED=35
		GREEN=bc
		BLUE=ba
		COLOR=1
	elif [[ "$i" == "Voilet" ]];
	then
		RED=7D
		GREEN=32
		BLUE=b2
		COLOR=1
	elif [[ "$i" == "Red" ]];
	then
		RED=B1
		GREEN=45
		BLUE=34
		COLOR=1
	elif [[ "$i" == "Green" ]];
	then
		RED=38
		GREEN=AD
		BLUE=30
		COLOR=1
	elif [[ "$i" == "Voilet-D" ]];
	then
		RED=76
		GREEN=9
		BLUE=f3
		COLOR=1
	elif [[ "$i" == "Pink-D" ]];
	then
		RED=e7
		GREEN=9
		BLUE=f3
		COLOR=1
  elif [[ "$i" == "Red-D" ]];
	then
		RED=f3
		GREEN=34
		BLUE=9
		COLOR=1
	elif [[ "$i" == "Yellow" ]];
	then
		RED=bf
		GREEN=9b
		BLUE=30
		COLOR=1
  elif [[ "$i" == "Yellow-D" ]];
	then
		RED=fa
		GREEN=ac 
		BLUE=5
		COLOR=1
	elif [[ "$i" == "Green-D" ]];
	then
		RED=4a
		GREEN=fa 
		BLUE=5
		COLOR=1
	elif [[ "$i" == "Blue-D" ]];
	then
		RED=5
		GREEN=90
		BLUE=fa 
		COLOR=1
	elif [[ "$i" == "White" ]];
	then
		RED=ff
		GREEN=ff
		BLUE=ff
		COLOR=1
 elif [[ "$i" == "Breathing" ]];
	then
		MODE=1
	elif [[ "$i" == "Cycle" ]]
	then
		MODE=2
		COLOR=1
	elif [[ "$i" == "Strobe" ]];
	then
		MODE=3
	elif [[ "$i" == "Low" ]];
	then
		SPEED=0
	elif [[ "$i" == "Medium" ]];
	then
		SPEED=1
	elif [[ "$i" == "High" ]];
	then
		SPEED=2
	elif printf "%d" "0x$i" > /dev/null 2>&1 
	then
	 if [[ "0x$i" -le 0xff ]];
	  then
      if [[ "$RED" == "0" ]];
			then
				  RED=$i
			elif [[ "$GREEN" == "0" ]];
			then
					GREEN=$i
			else 
				  BLUE=$i 
					COLOR=1
			fi
	 else
		   echo Crazy value detected, $i 
			 exit 1
	 fi
	else
		echo "BAD VALUE $i"
		zenity --info --text="BAD VALUE $i , Can't associate it" --width=400
		exit 1
	fi
	echo $i 
done

if [[ $COLOR == "0" ]];
then
  zenity --info --text="All colors were not set, maybe an issue?" --width=400
	echo "Set all colors please"
	exit 1
fi 
echo "VALUES"
echo RED =$RED=
echo GREEN =$GREEN= 
echo BLUE =$BLUE= 
echo MODE =$MODE=
echo SPEED =$SPEED=
sudo sh -c "echo $RED > /sys/devices/platform/faustus/kbbl/kbbl_red"
sudo sh -c "echo $GREEN > /sys/devices/platform/faustus/kbbl/kbbl_green"
sudo sh -c "echo $BLUE > /sys/devices/platform/faustus/kbbl/kbbl_blue"
sudo sh -c "echo $MODE > /sys/devices/platform/faustus/kbbl/kbbl_mode"
sudo sh -c "echo $SPEED > /sys/devices/platform/faustus/kbbl/kbbl_speed"
sudo sh -c "echo 2a > /sys/devices/platform/faustus/kbbl/kbbl_flags"
sudo sh -c "echo 1 > /sys/devices/platform/faustus/kbbl/kbbl_set"
