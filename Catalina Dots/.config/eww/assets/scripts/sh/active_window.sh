#! /usr/bin/bash

a=$(hyprctl activewindow -j | jq .title) && echo \${a:1:-1}

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  if [ ${line::12} == "activewindow" ]; then
    a=$(hyprctl activewindow -j | jq .title) && echo \${a:1:-1}
  fi
done
