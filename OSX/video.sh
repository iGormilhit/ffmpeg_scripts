#!/bin/bash

#This command must be adapted according to your os. From  "-f avfoundation" until "1" it is for os x. Consult ffmpeg documentation to grab video on other systems.
#At the end of the command adapt your path system where you want to save the file. It should be in the same folder where the previous audio file is saved.

	ffmpeg -f avfoundation -capture_cursor 1 -capture_mouse_clicks 1 -i "1" -c:v libx264 -qp 0 -preset ultrafast /path/to/file/test/capture.mp4

#Adapt your path system where the first video file is saved above.
#Convert the video with libvpx codec with .webm container to play the video in several browsers.
#Convert the video with libxvid codec and -qscale:v 3 parameter to play the video in safari.

	for file in /path/to/file/test/*.mp4; do
  	  ffmpeg -i "$file" -c:v libvpx -crf 18 -b:v 0 "${file%.mp4}".webm;
  	  ffmpeg -i "$file" -c:v libxvid -qscale:v 3 "${file%.mp4}".mov;
	done

exit 0
