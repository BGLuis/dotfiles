#!/bin/bash
if [ "$(hyprctl hyprsunset identity get)" = "true" ]; then
    hyprctl hyprsunset identity false
else
    hyprctl hyprsunset identity true
fi
