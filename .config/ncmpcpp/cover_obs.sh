#!/bin/bash

COVER="/tmp/album_cover.png"
COVER_SIZE="400"

#path to current song
song="$MUSIC_DIR/$(mpc --format %file% current)"
echo $song
#search for cover image
#art=$(find "$album"  -maxdepth 1 | grep -m 1 ".*\.\(jpg\|png\|gif\|bmp\)")
#art=$()
#if [ "$art" = "" ]; then
#  art="$HOME/.config/ncmpcpp/default_cover.png"
#fi
#copy and resize image to destination
ffmpeg -loglevel 0 -y -i "$song" -vf "scale=$COVER_SIZE:-1" "$COVER"
