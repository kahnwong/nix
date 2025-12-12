# Rustdesk

Pre-reqs:

```bash
sudo apt install ubuntu-desktop -y
sudo apt install xserver-xorg-video-dummy -y
sudo apt install lightdm -y
```

Install rustdesk via <https://rustdesk.com/docs/en/self-host/client-deployment/>, then run

```bash
sudo rustdesk --option allow-linux-headless Y
```

## Probably extra steps on headless server

### Update rustdesk config

```bash
sudo vi /root/.config/rustdesk/RustDesk2.toml
``````

```toml
rendezvous_server = 'rustdesk.xxx.xx:21116'
nat_type = 2
serial = 0

[options]
custom-rendezvous-server = 'rustdesk.xxx.xx'
key = '' # replace me
av1-test = 'Y'
verification-method = 'use-permanent-password'
allow-linux-headless = 'Y'
local-ip-addr = '' # use existing value, it should already be in the config file
```

Then set password with `sudo rustdesk --password "$PASSWORD"`


### Set display

```bash
sudo vi /etc/X11/xorg.conf.d/10-dummy.conf
```

```conf
Section "Device"
  Identifier "Dummy Device"
  Driver "dummy"
  VideoRam 256000
EndSection

Section "Monitor"
  Identifier "Dummy Monitor"
  HorizSync 28.0-80.0
  VertRefresh 48.0-75.0
  Modeline "1920x1080"  172.80  1920 2040 2248 2576  1080 1081 1084 1118 -hsync +vsync
EndSection

Section "Screen"
  Identifier "Dummy Screen"
  Monitor "Dummy Monitor"
  Device "Dummy Device"
  DefaultDepth 24
  SubSection "Display"
    Depth 24
    Modes "1920x1080"
  EndSubSection
EndSection

Section "ServerLayout"
  Identifier "Dummy Layout"
  Screen "Dummy Screen"
EndSection
```

Then reboot and log into rustdesk.


## Refs
- <https://github.com/rustdesk/rustdesk/wiki/Headless-Linux-Support>
- <https://github.com/rustdesk/rustdesk/discussions/6950>
