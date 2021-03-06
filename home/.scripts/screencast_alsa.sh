#!/bin/bash

#This is the ffmpeg command that the screencast shortcut in i3 will run.

#Picks a file name for the output file based on availability:

if [[ -d $HOME/Videos != true ]]; then
  mkdir $HOME/Videos
fi

while [[ -f $HOME/Videos/screencast$n.mkv ]]
do
	n=$((n+1))
done
filename="$HOME/Videos/screencast$n.mkv"

#The actual ffmpeg command:

ffmpeg -y \
-f x11grab \
-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
-i :0.0 \
-f alsa -i default \
 -c:v libx264 -r 30 -c:a flac $filename

