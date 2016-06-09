#!/bin/bash

#This command must be adapted according to your os. From  "-f avfoundation" until "1" it is for os x. Consult ffmpeg documentation to grab video on other systems.
#At the end of the command adapt your path system where you want to save the file. It should be in the same folder where the previous audio file is saved.

	ffmpeg -f avfoundation -capture_cursor 1 -capture_mouse_clicks 1 -i "1" -c:v libx264 -qp 0 -preset ultrafast /path/to/file/test/capture.mp4

exit 0
