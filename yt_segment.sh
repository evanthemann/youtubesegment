#!/bin/bash
echo "Enter YouTube url"
read url
echo "Start segment where? minutes:seconds"
read start
echo "End segment where? minutes:seconds"
read end
echo "Downloading and cutting..."
FILENAME=$(youtube-dl -f 22 --get-filename $url)
youtube-dl -f 22 $url
ffmpeg -i "$FILENAME" -ss $start -to $end -c:v copy -c:a copy output.mp4
echo "All done!"
