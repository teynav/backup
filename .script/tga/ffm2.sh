#!/bin/bash
a=$1
#a=$(echo "$1" | sed "s/\.mp4 /\.mp4 \n/g" | sed "s/\.mkv /\.mkv \n/g")
SAVEIFS=$IFS   # Save current IFS
IFS=$' /'      # Change IFS to new line
a=($a) # split to array $names
IFS=$SAVEIFS   # Restore IFS
for i in ${!a[@]}
do
  echo ${a[$i]}
  a[$i]=$(echo ${a[$i]})
done
echo These files will be Compressed
pw=$(pwd)
read x
#for i in ${!a[@]}
#do
#if [[ $2 == "1" ]]
#then
#ffmpeg -i "$pw/${a[$i]}" -map 0:a -acodec libmp3lame  "/home/navtey/Music/.tmp/$(echo ${a[$i]} | sed "s/\.[^.]*$//g" | sed "s/^.*\///g" ).mp3"
#else
#ffmpeg -i "$pw/${a[$i]}" -map 0:a -acodec libmp3lame  "$(echo ${a[$i]} | sed "s/\.[^.]*$//g" | sed "s/^.*\///g" ).mp3"
#fi
#done
