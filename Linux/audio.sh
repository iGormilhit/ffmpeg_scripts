#!/usr/bin/env bash
# -*- coding: utf8 -*-
#
# This script is [doing what ?]
#
# [Licence] [date]
# Contributors: [name]<email>


# help function
help() {
    echo
    echo "$0 use ffmpeg to record the audio input"
    echo
    echo "-h or --help display this message"
    echo
    echo "Usage : $0 path/to/your/files name-of-your-file card-number"
    echo
    echo "Linux users will find the soundcard number with:"
    echo "cat /proc/asound/cards or arecord -l"
    echo
    echo "OS X users will fin the soundcard number with:"
    echo "ffmpeg -f avfoundation -list_devices true -i \"\""
    echo
    echo "Consult ffmpeg documentation for more options"
    echo "or to grab audio on other systems:"
    echo "https://www.ffmpeg.org/documentation.html"
    echo
    echo "Codec audio aac +parameters for lossless recording"

    exit 1
}


# display help message when the necessary arguments aren't there
if [ $# -lt 3 ]; then
    help
fi

# display help message when -h options is used
# This don't work, it break the $1 $2 and $3
# while test -n "$1"; do
#     case "$1" in
#         --help|-h)
#             help
#             ;;
#     esac
#     shift
# done

path=$1
name=$2
soundcardnumber=$3
os=`uname`

if [ $os == "Linux" ]; then
    ffmpeg -f alsa -i hw:$soundcardnumber -c:a aac -qp 0 -preset ultrafast $path/$name.aac;
else
    echo "Misses the OS X command"
fi

echo "audio stream successfully recorded"

exit 0

