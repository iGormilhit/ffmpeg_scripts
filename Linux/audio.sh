#!/bin/bash
# -*- coding: utf8 -*-
#
# This script is ...
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
    echo "cat /proc/asound/cards"
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
while test -n "$1"; do
    case "$1" in
        --help|-h)
            help
            ;;
        *)
            echo "Unknown argument: $1"
            help
            ;;
    esac
    shift
done

path=$1
name=$2
soundcardnumber=$3

ffmpeg -f alsa -i hw:$soundcardnumber -c:a aac -qp 0 -preset ultrafast $path/$name.aac
echo "audio stream successfully recorded"

exit 0

