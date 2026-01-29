#!/bin/bash

# folder with ascii files
ascii_folder="/home/max/ii"
# a file to keep track of last used logo index
state_file="/tmp/fastfetch_logo_index"

# array of ascii logo files
ascii_files=(
  "$ascii_folder/maoscii.txt"
  "$ascii_folder/enriscii.txt"
  "$ascii_folder/marscii.txt"
  "$ascii_folder/cafiscii1.txt"
  "$ascii_folder/bakiscii.txt"
  "$ascii_folder/cafiscii2.txt"
)

# number of ascii files
count=${#ascii_files[@]}

# read last index from file or start at -1
if [[ -f "$state_file" ]]; then
  last_index=$(cat "$state_file")
else
  last_index=-1
fi

# calculate next index in rotation
next_index=$(( (last_index + 1) % count ))

# save next index for next run
echo "$next_index" > "$state_file"

# pick ascii file for this run
selected_ascii="${ascii_files[$next_index]}"

# run fastfetch with selected ascii file
fastfetch --logo "$selected_ascii"

