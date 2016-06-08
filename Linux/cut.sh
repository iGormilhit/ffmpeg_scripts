#!/bin/bash

#Adapt your path system where the previous files are saved. Audio and multiple video files should be in the same folder.

#For the audio.aac file cut the file from the time [HH:MM:SS] for a duration of [HH:MM:SS] eg: from second 3 until second 30 put 00:00:03 -t 00:00:27
#and rename the file as audio_cut.aac
#watch to have the same time for the audio & video file to synchronize

	ffmpeg -i /path/to/file/test/audio.aac -ss 00:00:00 -t 00:00:10 -c:a copy /path/to/file/test/audio_cut.aac

#For every file with "_all.mp4" at the end, cut the video from the time [HH:MM:SS] for a duration of [HH:MM:SS] eg: from second 1 until second 28 put 00:00:01 -t 00:00:27
#and rename the file with "_cut.mp4" at the end.
#adapt the 2 time values according to your needs.
	
	for name in /path/to/file/test/*.mp4; do
	ffmpeg -i "$name" -ss 00:00:03 -t 00:00:08 -async 1 -strict -2 "${name%.mp4}"_cut.mp4;
	done

#Do the same for ".mov" files and add "-c:v" + video codec libxvid + qscale parameter" to be sure to keep the codec for safari with the .mov container

	for name in /path/to/file/test/*.mov; do
	ffmpeg -i "$name" -ss 00:00:03 -t 00:00:08 -c:v libxvid -qscale:v 3 -async 1 -strict -2 "${name%.mov}"_cut.mov;
	done

#Do the same for ".webm" files but add "-c:v " + video codec libvpx + audio codec libvorbis" to be sure to keep the audio & video codecs for
#different browsers with the .webm container.

	for name in /path/to/file/test/*.webm; do
	ffmpeg -i "$name" -ss 00:00:03 -t 00:00:08 -c:v libvpx -crf 18 -c:a libvorbis -b:v 0 -async 1 -strict -2 "${name%.webm}"_cut.webm;
	done

#Compile the cut audio & video files. Watch to have the audio & video files synchronized with the same duration

	for file in /path/to/file/test/*_cut.mp4; do
          ffmpeg -i "$file" -i /path/to/file/test/audio_cut.aac -strict experimental "${file%.mp4}"_all.mp4;
        done
        for file in /path/to/file/test/*_cut.mov; do
          ffmpeg -i "$file" -i /path/to/file/test/audio_cut.aac -c:v libxvid -c:a aac -qscale:v 3 -strict experimental "${file%.mov}"_all.mov;
        done
        for file in /path/to/file/test/*_cut.webm; do
          ffmpeg -i "$file" -i /path/to/file/test/audio_cut.aac -c:v libvpx -crf 18 -b:v 0 -c:a libvorbis -strict experimental "${file%.webm}"_all.webm;
        done

#Rename your final file as you want

	echo "Rename your file and press ENTER :"
	read name
	if [ -n $name ];
	then
  	mv /path/to/file/test/capture_cut_all.mp4 /path/to/file/test/${name}.mp4
  	mv /path/to/file/test/capture_cut_all.mov /path/to/file/test/${name}.mov
  	mv /path/to/file/test/capture_cut_all.webm /path/to/file/test/${name}.webm
fi

exit 0

