#!/bin/bash

PROFILE_FILE="/tmp/power-profile"

CURRENT_PROFILE=$(powerprofilesctl get)

echo "$CURRENT_PROFILE" > "$PROFILE_FILE"

powerprofilesctl set power-saver
