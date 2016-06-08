#!/bin/bash

#Adapt your path system where the previous files are saved. Audio and multiple video files should be in the same folder.

#For the audio.aac file cut the file from the time [HH:MM:SS] for a duration of [HH:MM:SS] eg: from second 3 until second 30 put 00:00:03 -t 00:00:27
#and rename the file as audio_cut.aac
#watch to have the same time for the audio & video file to synchronize

	ffmpeg -i /home/alex/Bureau/test/audio.aac -ss 00:00:01 -t 00:00:06 -c:a copy /home/alex/Bureau/test/audio_cut.aac

#For every file with "_all.mp4" at the end, cut the video from the time [HH:MM:SS] for a duration of [HH:MM:SS] eg: from second 1 until second 28 put 00:00:01 -t 00:00:27
#and rename the file with "_cut.mp4" at the end.
#adapt the 2 time values according to your needs.
	
	for name in /home/alex/Bureau/test/*.mp4; do
	ffmpeg -i "$name" -ss 00:00:01 -t 00:00:06 -async 1 -strict -2 "${name%.mp4}"_cut.mp4;
	done

#Do the same for ".mov" files and add "-c:v" + video codec libxvid + qscale parameter" to be sure to keep the codec for safari with the .mov container

	for name in /home/alex/Bureau/test/*.mov; do
	ffmpeg -i "$name" -ss 00:00:01 -t 00:00:06 -c:v libxvid -qscale:v 3 -async 1 -strict -2 "${name%.mov}"_cut.mov;
	done

#Do the same for ".webm" files but add "-c:v " + video codec libvpx + audio codec libvorbis" to be sure to keep the audio & video codecs for
#different browsers with the .webm container.

	for name in /home/alex/Bureau/test/*.webm; do
	ffmpeg -i "$name" -ss 00:00:01 -t 00:00:06 -c:v libvpx -crf 18 -c:a libvorbis -b:v 0 -async 1 -strict -2 "${name%.webm}"_cut.webm;
	done

#Compile the cut audio & video files. Watch to have the audio & video files synchronized with the same duration

	for file in /home/alex/Bureau/test/*_cut.mp4; do
          ffmpeg -i "$file" -i /home/alex/Bureau/test/audio_cut.aac -strict experimental "${file%.mp4}"_all.mp4;
        done
        for file in /home/alex/Bureau/test/*_cut.mov; do
          ffmpeg -i "$file" -i /home/alex/Bureau/test/audio_cut.aac -c:v libxvid -c:a aac -qscale:v 3 -strict experimental "${file%.mov}"_all.mov;
        done
        for file in /home/alex/Bureau/test/*_cut.webm; do
          ffmpeg -i "$file" -i /home/alex/Bureau/test/audio_cut.aac -c:v libvpx -crf 18 -b:v 0 -c:a libvorbis -strict experimental "${file%.webm}"_all.webm;
        done

#Rename your final file as you want

	echo "Rename your file and press ENTER :"
	read name
	if [ -n $name ];
	then
  	mv /home/alex/Bureau/test/capture_cut_all.mp4 /home/alex/Bureau/test/${name}.mp4
  	mv /home/alex/Bureau/test/capture_cut_all.mov /home/alex/Bureau/test/${name}.mov
  	mv /home/alex/Bureau/test/capture_cut_all.webm /home/alex/Bureau/test/${name}.webm
fi

exit 0

