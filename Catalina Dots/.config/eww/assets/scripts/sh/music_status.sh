#! /usr/bin/bash

playerctl -a metadata -F --format "{\"status\": \"{{ status }}\", \"shuffle\": {{shuffle}}, \"repeat\": \"{{loop}}\"}" | while read -r line; do 
    if [ $(playerctl -l | grep spotify) ]; then 
        echo $line
    elif [ $(playerctl -l | grep vlc) ]; then 
        echo $line
    else 
        echo "null"
    fi
done