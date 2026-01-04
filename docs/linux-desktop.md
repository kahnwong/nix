# Linux Desktop

## crontabs

### sudo

```bash
@reboot sudo -b ydotoold --socket-path="/home/kahnwong/.ydotool_socket" --socket-own="1000:1000"
```

## Configs

- If you install linux on mac devices, install gnome-tweaks (`sudo apt install gnome-tweaks`) to remap super and alt
  button.
- Add m4a support to RhythmBox: `sudo apt install gstreamer1.0-fdkaac -y`

<!-- - `CopyQ`: set shortcut to `alt + shift + v` for `show the tray menu` -->

## Set Symlinks

```bash
ln -s /mnt/ssd/Git ~/Git
ln -s /mnt/hdd/Downloads ~/Downloads
ln -s /mnt/hdd/Kooha ~/Videos/Kooha
```

## Gnome Extensions

You probably need to install `gnome-browser-connector` and use chrome to install gnome extensions.

- [Hot Edge](https://extensions.gnome.org/extension/4222/hot-edge/)
- [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/)
- [Touchpad Gesture Customization](https://extensions.gnome.org/extension/7850/touchpad-gesture-customization/)

## Fonts

You don't need this for Ghostty, but intellij terminal needs this to render glyphs properly.

- For nerd fonts, download fonts from [here](https://github.com/ryanoasis/nerd-fonts/releases), put them in
  `~/.local/share/fonts` (or `~/.fonts`) then run `fc-cache -fv`.
- Fix Thai fonts: `sudo apt install fonts-thai-tlwg -y`

## Mouse

- To setup custom mouse buttons: <https://github.com/pwr-Solaar/Solaar>.
- For some mice, use <https://github.com/libratbag/piper/issues/352#issuecomment-1147626332>.

### Installing libratbag

If you run into errors: <https://github.com/libratbag/libratbag/issues/981>

```bash
sudo apt-get install meson ninja-build -y
sudo apt-get install libudev-dev libevdev-dev libglib2.0-dev libjson-glib-dev libunistring-dev libsystemd-dev swig check valgrind python3-dev python3-evde

git clone https://github.com/libratbag/libratbag.git
cd libratbag

meson builddir --prefix=/usr
meson configure builddir -Dsystemd-unit-dir=/usr/lib/systemd/system
ninja -C builddir
sudo ninja -C builddir install

sudo systemctl daemon-reload
sudo systemctl reload dbus.service
sudo systemctl enable ratbagd.service

flatpak install flathub org.freedesktop.Piper -y
```

## Notifications Mirroring

- iOS: <https://github.com/impiaaa/ios-notif-forward>

## App Errors

- Fix discord not loading: `rm -rf ~/.var/app/com.discordapp.Discord`

## Battery Optimization (TLP)

```bash
sudo tlp start

sudo tlp bat
sudo tlp ac
```

## Fingerprint

Ref: <https://linuxvox.com/blog/linux-fingerprint-reader-ubuntu/>

```bash
fprintd-enroll
```

Use fingerprint for sudo

```bash
sudo pam-auth-update # enable `Fingerprint authentication`
```

Fix fprintd inactive after suspend:

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

## Flameshot

```bash
flatpak permission-set screenshot screenshot org.flameshot.Flameshot yes
```

<!-- ## Atuin -->
<!---->
<!-- Edit `sync_address` at `~/.config/atuin/config.toml` -->
<!---->
<!-- ```bash -->
<!-- atuin login -u <USERNAME> -->
<!-- atuin sync -->
<!-- ``` -->

## Power Management

- tlp
- power-profiles-daemon

## LLM

Install [lemonade](https://github.com/lemonade-sdk/lemonade/releases). Use the full packakge.
