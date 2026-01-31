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

    # --- battery charge status --- silly ---
    status=$(cat /sys/class/power_supply/BAT*/status)

    if [[ "$status" == "Charging" && "$bat" -lt 70 ]]; then
        charge_status="++ing~!"
    elif [[ "$status" == "Charging" && "$bat" -ge 70 ]]; then
        charge_status="++ing but.. i'm full~~"
    elif [[ "$status" == "Discharging" && "$bat" -lt 40 ]]; then
        charge_status="++ me~~!"
    else
        charge_status="--ing"
    fi


    # --- ram usage in gb ---
    mem_used=$(free -g | awk '/^Mem:/ {print $3}')
    mem_total=$(free -g | awk '/^Mem:/ {print $2}')

    # --- screen brightness (clean) ---
    # outputs just the % from brightnessctl -m
    bright=$(brightnessctl -m | awk -F, '{print $4}')

    # --- LAN ip ---
    # 192.168.x.x
    localip=$(ip -4 addr show | awk '/inet 192\.168\./ {print $2}' | cut -d/ -f1 | head -n1)
    #localip=$(hostname -i | grep -oE '192\.168\.[0-9]+\.[0-9]+')
    
    # --- public IP ---
    # attached to the fetchpubip service and the .config/i3/fetch_public_ip.sh script
    pubip=$(cat ~/.config/i3/public_ip.txt)

    # --- cpu usage ---
    #cpu_idle1=$(awk '/^cpu / {print $5}' /proc/stat)
    #cpu_total1=$(awk '/^cpu / {total=0; for(i=2;i<=NF;i++) total+=$i; print total}' /proc/stat)
    #cpu_idle2=$(awk '/^cpu / {print $5}' /proc/stat)
    #cpu_total2=$(awk '/^cpu / {total=0; for(i=2;i<=NF;i++) total+=$i; print total}' /proc/stat)
    #cpu=$((100 * ( (cpu_total2 - cpu_total1) - (cpu_idle2 - cpu_idle1) ) / (cpu_total2 - cpu_total1) ))

    # --- date/time ---
    dt=$(date '+%Y年%m月%d日 %H時%M分%S秒')

    # --- print bar line ---
    echo "vol.$volume% | $charge_status ($bat%) | bri.$bright | lan.$localip | pub.$pubip | "$mem_used"/"$mem_total"gb | $dt"

    sleep 0.01
done

