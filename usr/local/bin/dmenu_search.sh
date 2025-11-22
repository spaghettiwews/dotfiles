#!/bin/bash

query=$(echo "" | rofi -dmenu -l 0 -P "search") || exit 0

if [ -n "$query" ]; then
  hyprctl dispatch workspace 2
  xdg-open "https://leta.mullvad.net/search?q=${query// /+}"
fi
