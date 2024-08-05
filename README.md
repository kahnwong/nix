# nix

Flake migration based on <https://github.com/sebastiant/dotfiles>.

## Pre-requisites

Edit `./scripts/apply.sh` and set appropriate build command. See `flake.nix` for available options.

Examples:

```bash
# macbook
nix build '.#homeManagerConfigurations.macbookMain.system'

# linux
nix build '.#homeManagerConfigurations.nuc.activationPackage'
```

File content should look like this:

```bash
#!/bin/bash

export NIXPKGS_ALLOW_UNFREE=1
nix build '.#homeManagerConfigurations.macbookMain.system' --experimental-features 'nix-command flakes'  --impure

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

### Linux Extras

- If you need `tailscale`, `caddy`, `fail2ban`, or `docker` on your server, install it via your system's package manager, since nix requires you set up systemd services explicitly.

- For nerd fonts, download fonts from [here](https://github.com/ryanoasis/nerd-fonts/releases), put them in `~/.local/share/fonts` (or `~/.fonts`) then run `fc-cache -fv`.

- To setup custom mouse buttons: <https://github.com/pwr-Solaar/Solaar>.
  - For some mouses, use <https://github.com/libratbag/piper/issues/352#issuecomment-1147626332>.
- If you install linux on mac devices, install gnome-tweaks (`sudo apt install gnome-tweaks`) to remap super and alt button.
- Set Flameshot shortcut: <https://flameshot.org/docs/guide/key-bindings/#on-ubuntu-and-other-gnome-based-distros>. Flatpak path: `/var/lib/flatpak/exports/bin/org.flameshot.Flameshot`.
- Set Kitty app launcher: <https://sw.kovidgoyal.net/kitty/binary/#desktop-integration-on-linux>.
- Launch CopyQ on startup: `/var/lib/flatpak/exports/bin/com.github.hluk.copyq --start-server toggle`. On Wayland, add prefix `env QT_QPA_PLATFORM=xcb`.
- Start synthingy on startup: `flatpak run --command=SyncThingy com.github.zocker_160.SyncThingy`.

## Post-installation instructions

### Linux: Set default shell

```bash
`chsh` and type `$HOME/.nix-profile/bin/fish`

# or this one
`vi /etc/passwd` and specify shell for your user
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
