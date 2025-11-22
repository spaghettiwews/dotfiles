#!/bin/zsh

typeset -A known=(
  'Keychron K8 Pro' '6C:93:08:63:C3:04' 
  'XL-HF102B SHARP' '6A:E6:4A:00:D9:BD'
  'Xbox Wireless Controller' '68:6C:E6:96:84:37'
  'WH-1000XM4' '88:C9:E8:2F:3C:89'
  'MX Master 3S' 'DB:BF:A3:C8:20:33'
  'Jabra Elite 3' '28:6F:40:DF:42:55'
  'WelsPhone' 'D8:DC:40:AE:B2:92'
)

function get_addr_or_fail () {
  if [ "$known[$1]" = "" ]
  then
    printf 'No device specified\n'
    exit 1 
  fi
  printf "$known[$1]"
}


case "$1" in
  "list")
    for k v ("${(@kv)known}") printf "$k\n"
    ;;
  "toggle")
    device=''
    tmp="$2"
    if [ "$tmp" = "" ] 
    then
      tmp=$($0 list | bemenu)
    fi
    device=$(get_addr_or_fail "$tmp")
    is_connected=$(bluetoothctl info $device | grep -i 'connected: yes')
    if [ "$is_connected" != "" ]
    then
      bluetoothctl disconnect $device
    else
      bluetoothctl connect $device
    fi
    ;;
  "status")
    device=$(get_addr_or_fail "$2")
    is_connected=$(bluetoothctl info $device | grep -i 'connected: yes')
    if [ "$is_connected" != "" ]
    then
      echo "{\"text\": \"Connected\", \"class\": \"custom-btdevice\", \"alt\": \"connected\" }"
    else 
      echo "{\"text\": \"Disconnected\", \"class\": \"custom-btdevice\", \"alt\": \"disconnected\" }"
    fi
    ;;
  *)
    printf "$0 list|toggle <device>|status <device>\n"
    exit 1
    ;;
esac

