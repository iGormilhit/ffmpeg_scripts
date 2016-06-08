#!/bin/bash
ffmpeg -f alsa -ac 2 -i hw:0 -c:a aac -qp 0 -preset ultrafast /home/alex/Bureau/audio.aac
