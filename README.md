# ffmpeg_scripts
Some basic scripts to automatize the tutorial creation workflow with ffmpeg. For all those who want to create tutorials with a free and powerful software through command line tool.

## Scripts construction

Assuming the recording of your screen and audio at the same time could demand a lot of ressources to your CPU, this workflow is built to aim at reducing this demand by splitting the process of recording audio and video.

1. Run the `audio.sh` script and press `q` when you want to stop recording  
2. Run the `video.sh` script while listening to the audio and press `q` when you want to stop recording. 
3. Adapt the time to your needs and run the `cut.sh` script  
	3.1. It will automatically cut the audio and video files according to the time you specified.  
	3.2. It will convert in ".webm" and ".mov" to stream on the web. Due to issues between some browsers and some formats  
	3.2. Then it will merge the audio and video files  
	3.3. Finally it will ask you to give a name to your final file  

Watch to have the audio and video files at the same duration to be well synchronized in the final file. Normally the final duration of the two files should be the same.

## Comments

The scripts are full of comments describing what they do and what you have to adapt. Please read them and ask me if it is not clear.

## change_path.sh script

The `change_path.sh` script allows you to automatically change the several `path/to/your/folder/files` in the three `.sh` files accorded to your system architecture. Please read the comments and let me know it it is not clear.
