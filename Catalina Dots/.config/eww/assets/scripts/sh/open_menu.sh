#! /usr/bin/bash

if [[ $(eww active-windows | grep menu) ]]; then
    eww close menu
else 
    eww open menu
    hyprctl keyword bind , ESCAPE, exec, "eww close menu; hyprctl keyword unbind ,ESCAPE"
fi