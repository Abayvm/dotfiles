#!/bin/bash

chosen=$(nmcli -t -f SSID dev wifi | sort -u | rofi -dmenu -p "WiFi SSID")

if [ -n "$chosen" ]; then
    nmcli dev wifi connect "$chosen"
fi

