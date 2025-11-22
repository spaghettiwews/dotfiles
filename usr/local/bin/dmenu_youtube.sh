#!/bin/bash

input=$(echo "" | rofi -dmenu -l 0 -p "YouTube URL:") || exit 0

if [ -n "$input" ]; then
  #xdg-open "https://www.google.com/search?q=${input// /+}"
  filename=$(yt-dlp --get-filename -o "$HOME/Videos/YouTube/%(title)s.%(ext)s" "$input")
  yt-dlp -f "bv+ba/b" -o "$filename" "$input"

  if [ $? -eq 0 ]; then
    dunstify "yt-dlp" "Download complete: $video"
    vlc "$filename"
  else
    dunstify "yt-dlp" "An error occurred."
  fi
fi
