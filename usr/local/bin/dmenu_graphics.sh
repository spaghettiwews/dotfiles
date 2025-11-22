#!/bin/bash

choice=$(printf "Integrated\nNVIDIA\nHybrid" | rofi -dmenu -p "Select:") || exit 0

case "$choice" in
Integrated) supergfxctl -m Integrated && hyprctl dispatch exit ;;
NVIDIA) supergfxctl -m NvidiaNoModeset && hyprctl dispatch exit ;;
Hybrid) supergfxctl -m Hybrid && hyprctl dispatch exit ;;
*) ;;
esac
