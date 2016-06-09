#!/bin/bash

#Adapt your path system where the previous files are saved. Audio and multiple video files should be in the same folder.

#For the audio.aac file cut the file from the time [HH:MM:SS] for a duration of [HH:MM:SS] eg: from second 3 until second 30 put 00:00:03 -t 00:00:27
#and rename the file as audio_cut.aac
#watch to have the same time for the audio & video file to synchronize

	ffmpeg -i /path/to/file/test/audio.aac -ss 00:00:01 -t 00:00:10 -c:a copy /path/to/file/test/audio_cut.aac

#For every ".mp4" file, cut the video from the time [HH:MM:SS] for a duration of [HH:MM:SS] eg: from second 1 until second 28 put 00:00:01 -t 00:00:27
#and convert in ".webm" and ".mov" files while adding "_cut" in the name
#adapt the 2 time values according to your needs.
	
	for name in /path/to/file/test/*.mp4; do
	ffmpeg -i "$name" -ss 00:00:01 -t 00:00:10 -async 1 -strict -2 "${name%.mp4}"_cut.mp4;
	ffmpeg -i "$name" -ss 00:00:01 -t 00:00:10 -c:v libxvid -qscale:v 3 -async 1 -strict -2 "${name%.mov}"_cut.mov;
	ffmpeg -i "$name" -ss 00:00:01 -t 00:00:10 -c:v libvpx -crf 18 -c:a libvorbis -b:v 0 -async 1 -strict -2 "${name%.webm}"_cut.webm;
	done

	echo "successfully cut and converted"

#Compile the cut audio & video files. Watch to have the audio & video files synchronized with the same duration
#rename with "_all" at the end

	for file in /path/to/file/test/*_cut.mp4; do
          ffmpeg -i "$file" -i /path/to/file/test/audio_cut.aac -strict experimental capture_cut_all.mp4;
        done
        for file in /path/to/file/test/*_cut.mov; do
          ffmpeg -i "$file" -i /path/to/file/test/audio_cut.aac -c:v libxvid -c:a aac -qscale:v 3 -strict experimental capture_cut_all.mov;
        done
        for file in /path/to/file/test/*_cut.webm; do
          ffmpeg -i "$file" -i /path/to/file/test/audio_cut.aac -c:v libvpx -crf 18 -b:v 0 -c:a libvorbis -strict experimental capture_cut_all.webm;
        done

	echo "successfully merged and converted"

#For every file in with "_all" rename your final file as you want eg: "final"

	echo "Rename your file and press ENTER :"
	read name
	if [ -n $name ];
	then
  	mv /path/to/file/test/*_all.mp4 /path/to/file/test/${name}.mp4
	mv /path/to/file/test/*_all.webm /path/to/file/test/${name}.webm
	mv /path/to/file/test/*_all.mov /path/to/file/test/${name}.mov

	echo "successfully renamed"
fi

#Remove all "_cut" files and keep the original audio and video files + the final files.
	rm /path/to/file/test/*_cut.*

exit 0
