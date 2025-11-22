#!/bin/bash

uptime_seconds=$(cut -d. -f1 /proc/uptime)

days=$((uptime_seconds / 86400))
hours=$(((uptime_seconds % 86400) / 3600))
minutes=$(((uptime_seconds % 3600) / 60))

output="up:"

[[ $days -gt 0 ]] && output+=" ${days}d"
[[ $hours -gt 0 ]] && output+=" ${hours}h"
output+=" ${minutes}m"

output=${output%,}

echo ${output#"${output%%[![:space:]]*}"}
