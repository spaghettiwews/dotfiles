#!/bin/bash

nvtop -s | jq -r '[.[] |
  "\((if (.device_name | test("NVIDIA")) then "NVIDIA" else "AMD" end)) u: \(.gpu_util) m: \(.mem_util) t: \(.temp) p: \(.power_draw)"
] | join(" | ")'
