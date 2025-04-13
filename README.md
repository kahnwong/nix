# nix

Flake migration based on <https://github.com/sebastiant/dotfiles>.

## Pre-requisites

Create `./scripts/apply.sh` and set appropriate build command. See `flake.nix` for available options.

File content should look like this:

```bash
#!/bin/bash

export NIXPKGS_ALLOW_UNFREE=1

## macbook
#nix build '.#homeManagerConfigurations.macbookMain.system' --experimental-features 'nix-command flakes' --impure
# linux
nix build '.#homeManagerConfigurations.nuc.activationPackage' --experimental-features 'nix-command flakes' --impure

if [[ $(uname -s) == 'Darwin' ]]; then
    sudo ./result/activate

    elif [[ $(uname -s) == 'Linux' ]]; then
    ./result/activate
fi
```

## Usage

```bash
make common

# optional
make common-dev
```

### Mac OS Extras

1. Login to `App Store`
2. `make mac`

### Rust

If nix gc borks rust, run following commands:

```bash
rustup show
rustup toolchain remove $toolchain_version
rustup install 1.83.0
```

### Linux Extras

#### Packages
- If you need `tailscale`, `caddy`, `fail2ban`, or `docker` on your server, install it via your system's package manager, since nix requires you set up systemd services explicitly.

#### Fonts (you don't need this for Ghostty, but intellij terminal needs this to render glyphs properly)
- For nerd fonts, download fonts from [here](https://github.com/ryanoasis/nerd-fonts/releases), put them in `~/.local/share/fonts` (or `~/.fonts`) then run `fc-cache -fv`.
- Fix Thai fonts: `sudo apt install fonts-thai-tlwg -y`

#### Mouse
- To setup custom mouse buttons: <https://github.com/pwr-Solaar/Solaar>.
  - For some mice, use <https://github.com/libratbag/piper/issues/352#issuecomment-1147626332>.

#### Configs
- If you install linux on mac devices, install gnome-tweaks (`sudo apt install gnome-tweaks`) to remap super and alt button.
- Add m4a support to RhythmBox: `sudo apt install gstreamer1.0-fdkaac -y`
- `CopyQ`: set shortcut to `alt + shift + v` for `show the tray menu`

#### Notifications Mirroring
- iOS: <https://github.com/impiaaa/ios-notif-forward>

#### App Errors
- Fix discord not loading: `rm -rf ~/.var/app/com.discordapp.Discord`

## Post-installation instructions

### Linux: Set default shell

```bash
`chsh` and type `$HOME/.nix-profile/bin/fish`

# or this one
`vi /etc/passwd` and specify shell for your user
```

#### Hyprland

<https://github.com/JaKooLit/Ubuntu-Hyprland>  # each distro has its own setup script

Reload config via: `hyprctl reload`

Todo:
- set mouse button bindings to switch workspace
- set startup apps

Issues:
- Wonky on NVIDIA, tried installing `libnvidia-egl-wayland1` but some apps won't render.
- You probably have to enable wayland socket via flatseal for some apps

```bash
## set default browser
xdg-settings set default-web-browser firefox_firefox.desktop  # probably different .desktop file on other distro

## vi ~/.config/hypr/UserConfigs/UserKeybinds.conf
- change default file manager to `dolphin`
- change default terminal to `ghostty`

## vi ~/.config/hypr/UserConfigs/UserSettings.conf
- add kb_layout: `th`
- add kb_options: `grp:ctrl_space_toggle`

# if on macbook, add to kb_options: `,altwin:swap_alt_win`

## vi ~/.config/hypr/hyprland.conf
# clipboard
exec-once = wl-paste --type text --watch cliphist store # Stores only text data
exec-once = wl-paste --type image --watch cliphist store # Stores only image data

bind = SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy

# screenshot
windowrule = noanim, class:^(flameshot)$
windowrule = float, class:^(flameshot)$
windowrule = move 0 0, class:^(flameshot)$
windowrule = pin, class:^(flameshot)$
windowrule = monitor 1, class:^(flameshot)$

bind = SUPER, X, exec, XDG_CURRENT_DESKTOP=sway /var/lib/flatpak/exports/bin/org.flameshot.Flameshot gui
```

### MacOS: Misc config

- set `tap to single click`
- set `three-finger drag`

## Upgrading

### Nix

```bash
make update
```

### Brew

```bash
brew upgrade
```

## Useful commands

```bash
# backup vscode extensions list
code --list-extensions | xargs -L 1 echo code --install-extension > ext_install.sh

# backup vscode config
cp "/users/$USER/Library/Application Support/Code/User/keybindings.json" .
cp "/users/$USER/Library/Application Support/Code/User/settings.json" .
```
