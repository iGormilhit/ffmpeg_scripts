#!/bin/bash

#This command must be adapted according to your os. "-f avfoundation -i +parameter" is for os x. Type `ffmpeg -f avfoundation -list_devices true -i ""` to know which audio
#device to record according to your system. Then put the number "0, 1 or n". Consult ffmpeg documentation to know more options or to grab audio on other systems.
#At the end of the command adapt your path system where you want to save the file.
#It is recommended to create a folder dedicated to the multiple video files you will obtain. To avoid modifying other media files you have on your computer.

	ffmpeg -f avfoundation -i ":1" -c:a aac -qp 0 -preset ultrafast /path/to/file/test/audio.aac

	echo "audio stream successfully recorded"

exit 0
