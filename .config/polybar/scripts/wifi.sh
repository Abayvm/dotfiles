#!/bin/bash

# Get current WiFi SSID
SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
IP=$(hostname -I | awk '{print $1}')

if [[ "$1" == "--menu" ]]; then
    # Show rofi menu of available networks and connect
    CHOICE=$(nmcli -t -f ssid dev wifi | grep -v '^--' | uniq | rofi -dmenu -p "WiFi Networks")

    if [ -n "$CHOICE" ]; then
        nmcli device wifi connect "$CHOICE" password "$(rofi -dmenu -p "Password for $CHOICE")"
    fi
else
    if [ "$SSID" ]; then
        echo "%{T2}%{T-} $SSID ($IP)"
    else
        echo "%{T2}睊%{T-} disconnected"
    fi
fi

