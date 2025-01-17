# nix

Flake migration based on <https://github.com/sebastiant/dotfiles>.

## Testing packages

```bash
nix-env -iA nixpkgs.ffsend

# uninstall
nix-env --uninstall ffsend
```

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

### Packages
- If you need `tailscale`, `caddy`, `fail2ban`, or `docker` on your server, install it via your system's package manager, since nix requires you set up systemd services explicitly.
- Install `sourcegit`: <https://github.com/sourcegit-scm/sourcegit>
- Install `ghostty`: <https://askubuntu.com/a/1536694>

### Fonts (only applicable if you don't use `Ghostty`)
- For nerd fonts, download fonts from [here](https://github.com/ryanoasis/nerd-fonts/releases), put them in `~/.local/share/fonts` (or `~/.fonts`) then run `fc-cache -fv`.

### Mouse
- To setup custom mouse buttons: <https://github.com/pwr-Solaar/Solaar>.
  - For some mouses, use <https://github.com/libratbag/piper/issues/352#issuecomment-1147626332>.

### Configs
- If you install linux on mac devices, install gnome-tweaks (`sudo apt install gnome-tweaks`) to remap super and alt button.
- Add m4a support to RhythmBox: `sudo apt install gstreamer1.0-fdkaac -y`
- `CopyQ`: set shortcut to `alt + shift + v` for `show the tray menu`

### App Errors
- Fix discord not loading: `rm -rf ~/.var/app/com.discordapp.Discord`

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
