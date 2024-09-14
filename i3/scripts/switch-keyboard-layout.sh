#!/bin/bash

function get_layout {
  setxkbmap -query | grep layout | awk '{print $2}'
}

function switch_layout {
  current_layout=$(get_layout)
  if [ "$current_layout" == "us" ]; then
    setxkbmap -layout latam
  else
    setxkbmap -layout us
  fi
}

switch_layout

