#!/bin/sh

killall waybar

if [[ $user = "aidan" ]] then
	waybar
else
	waybar &
fi
