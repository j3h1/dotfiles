#!/bin/bash

hyprctl workspaces -j | jq -c 'sort_by(.id)'

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  # if [ ${line::11} == "workspacev2" ]; then
  hyprctl workspaces -j | jq -c 'sort_by(.id)'
  # fi
done
