# Linux Desktop

## Hardware & Codecs

- If you install linux on mac devices, install gnome-tweaks (`sudo apt install gnome-tweaks`) to remap super and alt
  button.
- Add m4a support to RhythmBox: `sudo apt install gstreamer1.0-fdkaac -y`

## Peripherals

### Mouse

- To setup custom mouse buttons: <https://github.com/pwr-Solaar/Solaar>.
- For some mice, use <https://github.com/libratbag/piper/issues/352#issuecomment-1147626332>.

#### Installing libratbag

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

## Systems

### Battery Optimization (TLP)

```bash
sudo tlp start

sudo tlp bat
sudo tlp ac
```

It might get conflicted with `power-profiles-daemon`, in that case uninstall it and reinstall `tlp`.

### Crontabs

As `sudo`

```bash
@reboot sudo -b ydotoold --socket-path="/home/kahnwong/.ydotool_socket" --socket-own="1000:1000"
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

#### Fix fprintd inactive after suspend:

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

## Misc

### Notifications Mirroring

- iOS: <https://github.com/impiaaa/ios-notif-forward>

## Apps

### Discord

- Fix discord not loading: `rm -rf ~/.var/app/com.discordapp.Discord`

### Firefox

#### Fonts

Use `waree` for Thai sans-serif.

#### Containers

```js
// const icons = ["fingerprint", "briefcase", "dollar", "cart", "vacation", "gift", "food", "fruit", "pet", "tree", "chill", "circle"]
// if (url.hostname === "gemini.google.com") return { name: "Workspace", icon: "circle", color: "blue" };

const workspaceHosts = ["gemini.google.com", "meet.google.com", "console.cloud.google.com", "notebooklm.google.com", "gmail.com", "drive.google.com", "docs.google.com", "sheets.google.com"];
if (workspaceHosts.includes(url.hostname)) {
    return {name: "Workspace", icon: "circle", color: "blue"};
}

if (url.hostname === "www.google.com") return {name: "Search", icon: "circle", color: "green"};
if (url.hostname === "www.youtube.com") return {name: "YouTube", icon: "circle", color: "red"};
if (url.hostname === "contacts.google.com") return {name: "Contacts", icon: "circle", color: "purple"};
```

#### Privacy Settings

- Disable Telemetry Settings > Privacy & Security > Firefox Data Collection
- Change Search Engine Settings > Search (Switch to DuckDuckGo or Brave Search)
- Strict Protection Settings > Privacy & Security > Enhanced Tracking Protection (Set to Strict)
- DNS over HTTPS Settings > Privacy & Security > Enable Max Protection

#### Set Custom AI Chatbot

For Open WebUI.

Type `about:config` and set value for `browser.ml.chat.provider` as `https://chat.example.com/?model=gemma4-26b&temporary-chat=true`.

### Ntfyr

- Set to start in background

## Gnome

If not being redirected to login page via `Online Accounts`, run `gnome-keyring-daemon -r` and try again. But this'll prompt you to enter keyring password twice...
