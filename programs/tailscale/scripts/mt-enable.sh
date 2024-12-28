#!/bin/bash

echo "Start tailscale"
sudo tailscale up

echo "Sleep for 3 seconds"
sleep 3

echo "Adding iptables config"
systemctl restart docker
sudo nft -f ~/mullvad/config/mullvad_tailscale.conf
systemctl restart docker

echo "Verify that mullvad is active"
./is-mullvad-active.sh

echo "Verify that tailscale is active"
ping 100.98.42.10 # nuc@tailscale
