#!/bin/bash

choice=$(find /usr/local/bin/ -maxdepth 1 -name 'dmenu*' -exec sh -c 'for f; do basename "${f%.*}"; done' _ {} + | sed 's/dmenu_//g' | rofi -dmenu -p "Select script:") || exit 0

case "$choice" in
"$choice") /usr/local/bin/"dmenu_$choice.sh" ;;
*) ;;
esac
