#!/bin/bash

echo "Removing iptables config"
sudo nft delete table inet mullvad_tailscale

echo "Stop tailscale"
sudo tailscale down

echo "Verify that mullvad is active"
./is-mullvad-active.sh
