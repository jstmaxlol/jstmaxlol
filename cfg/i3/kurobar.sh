#!/bin/bash

while true; do
        # --- volume percentage ---
        volume=$(pamixer --get-volume)

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
    echo "V.$volume% | B.$bat% | Mu.$mem_used/Mt.$mem_total GB | L.$bright | $dt"

    sleep 0.01
done
