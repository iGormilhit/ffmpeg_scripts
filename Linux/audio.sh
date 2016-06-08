#!/bin/bash

#This command must be adapted according to your os. "-f alsa -i hw:0" is for Linux. Consult ffmpeg documentation to grab audio on other systems. Codec audio aac +parameters for lossless recording.
#At the end of the command adapt your path system where you want to save the file.
#It is recommended to create a folder dedicated to the multiple video files you will obtain. To avoid modifying other media files you have on your computer.

         ffmpeg -f alsa -i hw:0 -c:a aac -qp 0 -preset ultrafast /path/to/file/test/audio.aac

exit 0

