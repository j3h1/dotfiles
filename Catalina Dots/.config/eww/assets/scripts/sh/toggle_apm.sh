#!/usr/bin/bash

apm=$(nmcli radio wifi)

if [ $apm = "enabled" ]; then
    eww update apm_bool=disabled
    nmcli radio wifi off
elif [ $apm = "disabled" ]; then
    eww update apm_bool=enabled
    nmcli radio wifi on
fi