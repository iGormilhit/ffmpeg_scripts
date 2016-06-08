#!/bin/bash
for file in /home/alex/Bureau/capture_cut.mp4; do
  ffmpeg -i "$file" -i /home/alex/Bureau/audio.aac -c:v copy -c:a aac -strict experimental "${file%.mp4}"_all.mp4
done
for file in /home/alex/Bureau/capture_cut.mov; do
  ffmpeg -i "$file" -i /home/alex/Bureau/audio.aac -c:v copy -c:a aac -strict experimental "${file%.mov}"_all.mov
done
for file in /home/alex/Bureau/capture_cut.webm; do
  ffmpeg -i "$file" -i /home/alex/Bureau/audio.aac -c:v copy -c:a libvorbis -strict experimental "${file%.webm}"_all.webm
done
for file in /home/alex/Bureau/*_all.mp4; do
  mv "$file" /home/alex/Bureau/capture_all.mp4;
done
for file in /home/alex/Bureau/*_all.webm; do
  mv "$file" /home/alex/Bureau/capture_all.webm;
done
for file in /home/alex/Bureau/*_all.mov; do
  mv "$file" /home/alex/Bureau/capture_all.mov;
done
exit 0
