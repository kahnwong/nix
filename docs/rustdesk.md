# Rustdesk

Ref: <https://github.com/rustdesk/rustdesk/wiki/Headless-Linux-Support>


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
