#!/bin/bash

choice=$(printf "kill\nsuspend\nreboot\nshutdown" | rofi -dmenu -p "Select:") || exit 0

case "$choice" in
kill) ps -u $USER -o pid,comm,%cpu,%mem | rofi -dmenu -i -c -l 10 -p Kill: | awk '{print $1}' | xargs -r kill ;;
suspend) systemctl suspend ;;
reboot) shutdown -r 0 ;;
shutdown) shutdown -P --no-wall 0 ;;
*) ;;
esac
