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

    # --- cpu usage ---
    #cpu_idle1=$(awk '/^cpu / {print $5}' /proc/stat)
    #cpu_total1=$(awk '/^cpu / {total=0; for(i=2;i<=NF;i++) total+=$i; print total}' /proc/stat)
    #cpu_idle2=$(awk '/^cpu / {print $5}' /proc/stat)
    #cpu_total2=$(awk '/^cpu / {total=0; for(i=2;i<=NF;i++) total+=$i; print total}' /proc/stat)
    #cpu=$((100 * ( (cpu_total2 - cpu_total1) - (cpu_idle2 - cpu_idle1) ) / (cpu_total2 - cpu_total1) ))

    # --- date/time ---
    dt=$(date '+%Y-%m-%d %H:%M:%S')

    # --- print bar line ---
    echo "V.$volume% | B.$bat% | $mem_used/$mem_total GB | L.$bright | $dt"

    sleep 0.01
done
