#!/bin/bash

source "`ueberzug library`"
COVER="/tmp/album_cover.png"

function crop_image {
	len=$(identify /tmp/album_cover.png | awk '{print $3}' | awk -Fx '{print $1}')
	hei=$(identify /tmp/album_cover.png | awk '{print $3}' | awk -Fx '{print $2}')
	left=$((($len-400)/2))
	top=$((($hei-225)/2))
	convert /tmp/album_cover.png -crop 400x225+$left+$top /tmp/album_cover.png 
}

function add_cover {
	#a=$crop_image
	ImageLayer::add [identifier]="img" [x]="2" [y]="1" [path]="$COVER"
}

ImageLayer 0< <(
if [ ! -f "$COVER" ]; then
	cp "$HOME/.config/ncmpcpp/default_cover.png" "$COVER"
fi
#rerender image when changed
while inotifywait -q -q -e close_write "$COVER"; do
	crop_image
	add_cover
done
)
