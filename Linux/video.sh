#!/bin/bash

#This command must be adapted according to your os. "-video_size" and "-f x11grab" are for linux and resolution depends on your screen. 
#For other parameters, or grab video on other systems, consult the official ffmpeg documentation for linux https://trac.ffmpeg.org/wiki/Capture/Desktop
#At the end of the command adapt your path system where you want to save the file. It should be in the same folder where the previous audio file is saved.

	ffmpeg  -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast /path/to/file/test/capture.mp4

exit 0
