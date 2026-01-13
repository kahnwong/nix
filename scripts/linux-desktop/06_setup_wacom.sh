#!/bin/bash

# export via: `dconf dump / | sed -n '/\[org.gnome.desktop.peripherals.tablets/,/^$/p' > wacom.conf`
dconf load / <programs/gnome/wacom.conf
