#!/usr/bin/env bash

black="#000000"
white="#ffffff"
redd="#f82323"

swaylock -c "030303" \
 --font "chirufont" -k \
 --inside-color "$black" --inside-clear-color "$black" --inside-ver-color "$black" --inside-wrong-color "$black" \
 --ring-color "$white" --ring-ver-color "$white" --ring-wrong-color "$white" --ring-clear-color "$redd"\
 --text-color "$white" --text-ver-color "$white" --text-wrong-color "$white" \
 --line-color "$black" --bs-hl-color "$white" --key-hl-color "$redd" \
 --indicator-thickness 4 --indicator-radius 64 --indicator-y-position 256
