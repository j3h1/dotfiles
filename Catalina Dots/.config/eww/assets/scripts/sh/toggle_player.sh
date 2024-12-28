#!/usr/bin/bash

playerctl -l | grep spotify >/dev/null
if [[ $? -eq 0 ]]; then
  playerctl -p spotify play-pause
fi

playerctl -l | grep vlc >/dev/null
if [[ $? -eq 0 ]]; then
  playerctl -p vlc play-pause
fi

