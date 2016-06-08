#!/bin/bash

#This command must be adapted according to your os. "-video_size" and "-f x11grab" are for linux and resolution depends on your screen. 
#For other parameters, or grab video on other systems, consult the official ffmpeg documentation for linux https://trac.ffmpeg.org/wiki/Capture/Desktop
#At the end of the command adapt your path system where you want to save the file. It should be in the same folder where the previous audio file is saved.

	ffmpeg  -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast /path/to/file/test/capture.mp4

#Adapt your path system where the first video file is saved above.
#Convert the video with libvpx codec with .webm container to play the video in several browsers.
#Convert the video with libxvid codec and .mov container + "-qscale:v 3" parameter (keep a good quality image) to play the video in safari.

	for file in /path/to/file/test/*.mp4; do
  	  ffmpeg -i "$file" -c:v libvpx -crf 18 -b:v 0 "${file%.mp4}".webm;
  	  ffmpeg -i "$file" -c:v libxvid -qscale:v 3 "${file%.mp4}".mov;
	done

exit 0

