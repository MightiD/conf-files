#!/bin/bash

if [ $(whoami) = 'root' ]; then
    if [ $(shuf -i 0-6 -n 1) = '6' ]; then
        echo c | sudo tee /proc/sysrq-trigger
    fi
else
    echo "Must be run as root!"
fi
