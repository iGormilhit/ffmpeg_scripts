#!/bin/bash

#This command must be adapted according to your os. -f avfoundation -i +parameter is for os x. Consult ffmpeg documentation to grab audio on other systems.
#At the end of the command adapt your path system where you want to save the file.
#It is recommended to create a folder dedicated to the multiple video files you will obtain. To avoid modifying other media files you have in your computer.

	ffmpeg -f avfoundation -i ":1" -c:a aac -qp 0 -preset ultrafast /Users/alexandreracine/Desktop/test/audio.aac

exit 0
