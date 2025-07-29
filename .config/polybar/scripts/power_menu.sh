#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nLogout" | rofi -dmenu -p "Power Menu")

case "$choice" in
  Shutdown)
    systemctl poweroff
    ;;
  Reboot)
    systemctl reboot
    ;;
  Logout)
    i3-msg exit  # Replace with your logout command if needed
    ;;
esac
