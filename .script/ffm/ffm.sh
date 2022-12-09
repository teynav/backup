#!/bin/bash
if [[ $1 == "1" ]]
then
ffmpeg -i "$2" -movflags use_metadata_tags -map 0:a -acodec libmp3lame  "/home/navtey/Music/.tmp/$(echo $2 | sed "s/\.[^.]*$//g").mp3"
else
ffmpeg -i "$2" --movflags use_metadata_tags -map 0:a -acodec libmp3lame  "$3""$(echo $2 | sed "s/\.[^.]*$//g").mp3"
fi
