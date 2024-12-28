#!/bin/bash

# Get the current Wi-Fi signal strength as a percentage
signal_strength=$(nmcli -f IN-USE,SIGNAL dev wifi | grep '*' | awk '{print $2}')
ethernet_interface=$(ip link show | grep -i 'enp\|eth' | grep -i 'UP' | awk '{print $2}' | tr -d ':')

# Check if we found a valid Ethernet interface
if [[ -n "$ethernet_interface" ]]; then
    # Check if the interface has an IP address
    ip_address=$(ip addr show "$ethernet_interface" | grep -i 'inet ' | awk '{print $2}')
    
    if [[ -n "$ip_address" ]]; then
        echo "wired"
        exit 0
    fi
fi

# Check if the signal strength was retrieved successfully
if [[ -n "$signal_strength" ]]; then
    echo "$signal_strength"
else
    echo "null"
fi
