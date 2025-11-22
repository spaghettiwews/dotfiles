#!/bin/bash

# input_date="2024-10-15T22:17:13+0000"
install_date=$(head -n 1 /var/log/pacman.log | awk '{print $1}' | tr -d '[]')

install_epoch=$(date -d "$install_date" +%s)

now_epoch=$(date +%s)

diff_seconds=$(( now_epoch - install_epoch ))
diff_days=$(( diff_seconds / 86400 ))

echo "$diff_days days"
