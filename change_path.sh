#!/bin/bash

#First adpat the path to your scripts folder and then adapt the path to change automatically in your script files.

for file in /path/to/your/scripts/folder/*.sh
do
  echo "Traitement de $file ..."
  sed -i -e "s/\/your\/old\/file\/path\//\/your\/new\/file\/path\//g" "$file"
done 
