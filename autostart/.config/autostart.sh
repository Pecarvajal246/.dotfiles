#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# run nitrogen --restore
run picom
run dunst
# run picom --experimental-backends
run nm-applet
run playerctld daemon
run mpDris2
run sxhkd
run twofi_d
run luminous-ttv
run feh --bg-scale /home/pedro/Images/wallpapers/wallhaven-ymjrzx_1920x1080.png
