#!/usr/bin/env bash

# Try first to get the location from ~/.config/i3/data/coordinates.txt
# If it doesn't exist, get the location from the IP address
coordinates=
if [ -f ~/.config/i3/data/coordinates.txt ]; then
    coordinates=$(cat ~/.config/i3/data/coordinates.txt)
else
    echo "Getting location from IP address..."
    coordinates=$(curl -s http://ip-api.com/json/$(curl -s https://ipinfo.io/ip) | jq '.lat, .lon')
    coordinates=$(echo $coordinates | sed 's/ /,/g')
    echo $coordinates > ~/.config/i3/data/coordinates.txt
fi

api_key="$(cat ~/.config/i3/data/weather_api_key.txt)"

# Get the weather data
request="http://api.weatherapi.com/v1/current.json?key=$api_key&q=$coordinates&aqi=no"

result=$(curl -s $request)
weather_current=$(echo $result | jq '.current.temp_c')

echo "$weather_current °C"
