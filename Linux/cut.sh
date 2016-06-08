#!/bin/bash
for name in /home/alex/Bureau/*.mp4; do
ffmpeg -i "$name" -ss 00:00:02 -t 00:00:14 -async 1 -strict -2 "${name%.mp4}"_cut.mp4;
done
for name in /home/alex/Bureau/*.mov; do
ffmpeg -i "$name" -ss 00:00:02 -t 00:00:14 -c:v libxvid -qscale:v 3 -async 1 -strict -2 "${name%.mov}"_cut.mov;
done
for name in /home/alex/Bureau/*.webm; do
ffmpeg -i "$name" -ss 00:00:02 -t 00:00:14 -c:v libvpx -crf 18 -b:v 0 -async 1 -strict -2 "${name%.webm}"_cut.webm;
done

exit 0
