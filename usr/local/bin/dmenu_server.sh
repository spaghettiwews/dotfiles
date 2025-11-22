#!/bin/bash

# List of scripts or commands
choice=$(printf "ssh-tunnel\ncontainers\ncertificates" | rofi -dmenu -p "Select:") || exit 0
heading=""

case "$choice" in
ssh-tunnel) output=$(cloudflared access ssh --hostname ssh.wews.co.zw --url 127.0.0.1:2222 &) || exit 0 ;;
containers)
  output=$(ssh root@127.0.0.1 -p 2222 "docker ps -a --format '{{.Status}};{{.Names}}' | column -t -s ';' -N 'STATUS,CONTAINER'")
  heading="containers"
  ;;
certificates)
  output=$(ssh root@127.0.0.1 -p 2222 "certbot certificates | grep -e Domains -e Expiry | sed 's/^[ \t]*//'")
  heading="certificates"
  ;;
#Lock) i3lock ;;
#Screenshot) scrot ~/Pictures/screenshot_%Y-%m-%d_%H%M%S.png ;;
#MyScript) ~/scripts/myscript.sh ;;
*) ;;
esac

dunstify "$heading" "$output"
