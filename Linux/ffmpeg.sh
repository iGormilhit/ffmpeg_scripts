#!/bin/bash
ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast /home/alex/Bureau/capture.mp4
for file in /home/alex/Bureau/*.mp4; do
  ffmpeg -i "$file" -c:v libvpx -crf 18 -b:v 0 "${file%.mp4}".webm;
  ffmpeg -i "$file" -c:v libxvid -qscale:v 3 "${file%.mp4}".mov;
done

exit 0
