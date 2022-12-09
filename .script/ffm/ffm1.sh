#!/bin/bash
a=$(find "$2" -maxdepth 1 -regex  '.*\(mp4\|mkv\)$') 
SAVEIFS=$IFS   # Save current IFS
IFS=$'\n'      # Change IFS to new line
a=($a) # split to array $names
IFS=$SAVEIFS   # Restore IFS
for i in ${!a[@]}
do
  echo ${a[$i]}
done
echo These files will be Converted
read x
mkdir "$2/.tmp"
for i in ${!a[@]}
do
ffmpeg -i "${a[$i]}" -movflags use_metadata_tags -map 0:a -acodec libmp3lame  "$2/.tmp/$(echo ${a[$i]} | sed "s/\.[^.]*$//g" | sed "s/^.*\///g" ).mp3"
done
