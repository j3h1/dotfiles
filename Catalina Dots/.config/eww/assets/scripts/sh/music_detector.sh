#!/usr/bin/bash

getPlayers () {
    players=""
    player_list=$(playerctl -l)

    echo $player_list | grep spotify > /dev/null
    if [[ $? -eq 0 ]]; then 
        players=$players$(playerctl -p "spotify" metadata -f "{\"image\": \"{{mpris:artUrl}}\", \"title\": \"{{title}}\", \"artist\": \"{{artist}}\", \"length\": {{mpris:length}}, \"player\": \"spotify\"},")
    fi

    echo $player_list | grep vlc > /dev/null
    if [[ $? -eq 0 ]]; then 
        players=$players$(playerctl -p "vlc" metadata -f "{\"image\": \"{{mpris:artUrl}}\", \"title\": \"{{title}}\", \"artist\": \"{{artist}}\", \"length\": {{mpris:length}}, \"player\": \"vlc\"},")
    fi

    if [ -z "$players" ]; then
        echo "null"
    else 
        echo $"["${players::-1}$"]"
    fi
}

getPlayers
playerctl -a -F metadata -f "{{mpris:length}}" | while read -r line; do
    getPlayers
done

echo 0