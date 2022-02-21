#!/bin/bash

#send notification
notify-send "Music Player" "NOW PLAYING: $(mpc | head -1)"

COVER="/tmp/album_cover.png"
COVER_SIZE="400"

#path to current song
song="$MUSIC_DIR/$(mpc --format %file% current)"

#copy and resize image to destination
ffmpeg -loglevel 0 -y -i "$song" -vf "scale=$COVER_SIZE:-1" "$COVER"
