#!/bin/bash

# Get the list of files in the folder
files=$(find $HOME/Pictures/wallpapers/ | xargs file | grep image | sed 's/:.*//')

files=($files)

# Generate a random number in the range of the number of files
random_number=$((RANDOM % ${#files[@]}))

# Randomly pick a file from the list
wallpaper="${files[$random_number]}"

if [[ "$wallpaper" == "$(cat ~/.current_wallpaper)" ]]; then
    # If the randomly picked wallpaper is the same as the current wallpaper,
    # pick the next wallpaper in the list
    random_number=$((random_number + 1))
    if [[ $random_number -ge ${#files[@]} ]]; then
        random_number=0
    fi
    wallpaper="${files[$random_number]}"
fi

# Set the wallpaper
feh --bg-scale "$wallpaper"

# Save the current wallpaper
echo "$wallpaper" > ~/.current_wallpaper
