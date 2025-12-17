#!/bin/bash

# <https://gabrielstaples.com/ydotool-tutorial/#gsc.tab=0>

sudo apt install -y cmake scdoc

git clone https://github.com/ReimuNotMoe/ydotool.git
cd ydotool || exit
mkdir build
cd build || exit
cmake ..
time make -j "$(nproc)"
sudo make install

cd ../.. || exit
rm -rf ydotool

echo "add this to 'sudo crontab -e'"
echo '@reboot sudo -b ydotoold --socket-path="/home/kahnwong/.ydotool_socket" --socket-own="1000:1000"'
