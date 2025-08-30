#!/bin/bash

echo BUILDING WAYBAR MUSIC MODULE

git clone https://github.com/Andeskjerf/waybar-module-music.git
cd waybar-module-music
cargo build --release

cp target/release/waybar-module-music ~/.local/bin/

cd ..
rm -rf waybar-module-music
