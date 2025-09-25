#!/bin/bash

while true; do
    # --- battery percentage ---
    if [ -d /sys/class/power_supply/BAT0 ]; then
        bat=$(cat /sys/class/power_supply/BAT0/capacity)
    else
        bat="N/A"
    fi

    # --- ram usage in gb ---
    mem_used=$(free -g | awk '/^Mem:/ {print $3}')
    mem_total=$(free -g | awk '/^Mem:/ {print $2}')

    # --- screen brightness (clean) ---
    # outputs just the % from brightnessctl -m
    bright=$(brightnessctl -m | awk -F, '{print $4}')

    # --- date/time ---
    dt=$(date '+%Y-%m-%d %H:%M:%S')

    # --- print bar line ---
    echo "$bat% | $mem_used/$mem_total GB | $bright | $dt"

    sleep 0.1
done
