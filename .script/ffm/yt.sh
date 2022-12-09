#!/bin/bash
a=$(<$1)
SAVEIFS=$IFS   # Save current IFS
IFS=$'\n'      # Change IFS to new line
a=($a) # split to array $names
IFS=$SAVEIFS   # Restore IFS
for i in ${!a[@]}
do
  echo ${a[$i]}
  a[$i]=$(echo ${a[$i]})
done
echo Links to be Downloaded
read x
for i in ${!a[@]}
do
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "${a[$i]}"
#youtube-dl -f 'bestaudio[ext=m4a]/bestaudio' -x "${a[$i]}"
done
