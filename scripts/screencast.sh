#!/bin/bash

[[ $# -lt 1 ]] && echo "screencast name missing" && exit 1

screen_size=$(xdpyinfo | grep dimensions | tr -d ' ' | cut -d ':' -f 2 | cut -d 'p' -f 1)

mkdir -p ~/vid

ffmpeg -f x11grab -s $screen_size -i $DISPLAY ~/vid/$1.mkv
