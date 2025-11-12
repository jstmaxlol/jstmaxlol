#!/usr/bin/env bash

while true; do
    curl -s ifconfig.me > ~/.config/i3/public_ip.txt
    sleep 3600
done &
