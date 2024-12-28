#!/usr/bin/bash

eww update "mute_bool=$(pamixer -t && pamixer --get-mute)"