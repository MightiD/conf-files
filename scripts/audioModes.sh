#!/bin/bash

set_mono() {
	easyeffects -l mono
	echo mono > /tmp/audioMode
	echo "Using mono audio"
}

set_stereo() {
	easyeffects -l stereo
	echo stereo > /tmp/audioMode
	echo "Using stereo audio"
}

mode=$(</tmp/audioMode)

if [[ "$2" == "start" ]]; then
	set_stereo
else
	if [[ "$mode" == "mono" ]]; then
		set_stereo
	elif [[ "$mode" == "stereo" ]]; then
		set_mono
	else
		set_stereo
	fi
fi


