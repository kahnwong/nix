#!/bin/bash

sudo apt install tlp cpufrequtils -y
sudo cp ./programs/tlp/tlp.conf /etc/tlp.conf

sudo tlp start
