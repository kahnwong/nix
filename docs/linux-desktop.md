# Linux Desktop

## Hardware

### Nvidia

```bash
sudo apt install nvidia-driver-570 # GTX 1060 6GB
```

### Broadcom

#### Linux on Intel Apple

```bash
sudo apt install broadcom-sta-dkms
```

#### broadcom-sta-dkms fails to build with kernel 7.0 HWE

<https://bugs.launchpad.net/ubuntu/+source/broadcom-sta/+bug/2161038>

```bash
--------------------------------------------
WORKAROUND (courtesy of eumir camara)
--------------------------------------------

Edit /usr/src/broadcom-sta-6.30.223.271/dkms.conf

Change:
MAKE[0]="make KVER=$kernelver"
to:
MAKE[0]="make KVER=$kernelver objtool=/bin/true"

Save file. Run:
sudo apt install broadcom-sta-dkms && sudo apt dist-upgrade
```

## Systems

### Crontabs

As `sudo`

```bash
@reboot sudo -b ydotoold --socket-path="/home/kahnwong/.ydotool_socket" --socket-own="1000:1000"
```

On apple devices, `super` key is `56`.

### File Browser

HEIC no preview on Ubuntu 26 Fix

```bash
sudo apt-get install libheif-plugin-libde265
```

### Fingerprint

Ref: <https://linuxvox.com/blog/linux-fingerprint-reader-ubuntu/>

```bash
fprintd-enroll
```

#### Use fingerprint for sudo

```bash
sudo pam-auth-update # enable `Fingerprint authentication`
```

#### Fix fprintd inactive after suspend

```bash
sudo vi /lib/systemd/system-sleep/fingerprint-wakeup.sh
```

```bash
#!/bin/bash

case "$1/$2" in
    post/*)
        # Restart the appropriate service on resume
        # Use only one of the lines below, based on your working service:
        /usr/bin/systemctl restart fprintd.service
        # /usr/bin/systemctl restart python3-validity.service
        ;;
esac
```

```bash
sudo chmod +x /lib/systemd/system-sleep/fingerprint-wakeup.sh
```

Then reboot.

### Fonts

You don't need this for Ghostty, but intellij terminal needs this to render glyphs properly.

- For nerd fonts, download fonts from [here](https://github.com/ryanoasis/nerd-fonts/releases), put them in
  `~/.local/share/fonts` (or `~/.fonts`) then run `fc-cache -fv`.
- Fix Thai fonts: `sudo apt install fonts-thai-tlwg -y`

## Asahi Linux

Run this, otherwise shutdown hangs on `dnf5daemon`.

```bash
gsettings set org.gnome.software allow-updates false
```

## Apps

### Clyp

Clear with `.local/share/bio.murat.clyp/clyp.db`. Need to run once in a while.

### Ntfyr

- Set to start in background

## Misc

### Notifications Mirroring

- iOS: <https://github.com/impiaaa/ios-notif-forward>
