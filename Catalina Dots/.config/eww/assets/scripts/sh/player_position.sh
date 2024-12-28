#! /usr/bin/bash

playerctl -l | grep spotify > /dev/null
if [[ $? -eq 0 ]]; then 
    playerctl --player=spotify position
    exit
fi

playerctl -l | grep vlc > /dev/null
if [[ $? -eq 0 ]]; then 
    playerctl --player=vlc position
    exit
fi

echo 0