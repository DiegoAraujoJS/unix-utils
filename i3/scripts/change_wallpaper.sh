#!/bin/bash

files="$(find $HOME/Pictures/wallpapers/ | xargs file | grep image | sed 's/:.*//')"

# Convert the list of files into an array
files=($files)

# Read the current wallpaper from a file
current_wallpaper=$(cat ~/.current_wallpaper)

# Find the index of the current wallpaper in the list
for i in ${!files[@]}; do
    if [[ "${files[$i]}" == "$current_wallpaper" ]]; then
        current_index=$i
        break
    fi
done

if [[ -z $current_index ]]; then
    current_index=0
fi
# 
# # Calculate the index of the next wallpaper
next_index=$((current_index + 1))
if [[ $next_index -ge ${#files[@]} ]]; then
    next_index=0
fi
echo $next_index
# 
# # Set the next wallpaper
next_wallpaper=${files[$next_index]}

feh --bg-scale "$next_wallpaper"

# Save the next wallpaper as the current wallpaper
echo "$next_wallpaper" > ~/.current_wallpaper
