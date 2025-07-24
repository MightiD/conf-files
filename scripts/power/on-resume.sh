#!/bin/bash

PROFILE_FILE="/tmp/power-profile"

if [[ -f "$PROFILE_FILE" ]]; then
    LAST_PROFILE=$(cat "$PROFILE_FILE")
    powerprofilesctl set "$LAST_PROFILE"
    rm -f "$PROFILE_FILE"
fi
