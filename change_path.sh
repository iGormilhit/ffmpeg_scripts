#!/bin/bash
for file in /home/alex/Documents/ffmpeg_scripts/OSX/*.sh
do
  echo "Traitement de $file ..."
  sed -i -e "s/\/Users\/alexandreracine\/Desktop\//\/path\/to\/file\//g" "$file"
done 
