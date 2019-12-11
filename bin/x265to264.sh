#!/bin/bash
for i in *.mkv ; do
    ffmpeg -i "$i" -bsf:v h264_mp4toannexb -vcodec libx264 "$i.ts"
    mv "$i.ts" "$i"
    sleep 3
done
