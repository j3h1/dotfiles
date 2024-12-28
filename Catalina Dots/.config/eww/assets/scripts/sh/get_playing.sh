#! /usr/bin/bash

playerctl -a -F status | while read -r line; do 
    playerctl -l | grep spotify > /dev/null
    if [[ $? -eq 0 ]]; then 
        echo $line
    fi

    playerctl -l | grep vlc > /dev/null
    if [[ $? -eq 0 ]]; then 
        echo $line
    fi

echo 0