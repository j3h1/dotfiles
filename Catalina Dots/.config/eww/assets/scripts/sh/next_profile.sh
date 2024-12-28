#!/usr/bin/bash

power=$(powerprofilesctl get)

if [ "$power" = "performance" ]; then
    powerprofilesctl set "balanced" &
    eww update "power_profile=balanced"

elif [ "$power" = "balanced" ]; then
    powerprofilesctl set "power-saver" &
    eww update "power_profile=power-saver"
elif [ "$power" = "power-saver" ]; then
    powerprofilesctl set "performance" &
    eww update "power_profile=performance"
    
fi