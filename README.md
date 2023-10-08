# nix

Flake migration based on <https://github.com/sebastiant/dotfiles>.

## Pre-requisites

Edit `./scripts/apply.sh` and set appropriate build command. See `flake.nix` for available options.

Examples:

```bash
# macbook
nix build '.#homeManagerConfigurations.macbook.system'

# linux
nix build '.#homeManagerConfigurations.nuc.activationPackage'
```

File content should look like this:

```bash
#!/bin/bash

$BUILD_COMMAND --experimental-features 'nix-command flakes'

if [[ $(uname -s) == 'Darwin' ]]; then
    sudo ./result/activate

    elif [[ $(uname -s) == 'Linux' ]]; then
    ./result/activate
fi
```

## Usage

```bash
make common
```

### Mac OS Extras

1. Login to `App Store`
2. `make mac`

### Linux Extras

- If you need `tailscale`, `caddy`, `fail2ban`, or `docker` on your server, install it via your system's package manager, since nix requires you set up systemd services explicitly.

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
