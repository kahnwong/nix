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
nix build '.#homeManagerConfigurations.workstation.activationPackage' --experimental-features 'nix-command flakes' --impure

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

### Rust

If nix gc borks rust, run following commands:

```bash
rustup show
rustup toolchain remove $toolchain_version
rustup install 1.90.0
```

### Run `sudo` without typing password

```bash
echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/99-nopasswd-$(whoami)
```

### Mac OS Extras

1. Login to `App Store`
2. `make mac`

### Linux Extras

- If you need `tailscale`, `caddy`, `fail2ban`, or `docker` on your server, install it via your system's package
  manager, since nix requires you to set up systemd services explicitly.

## Post-installation instructions

### uBlock Origin Blocklist

- [Microsoft GitHub Less Social](https://codeberg.org/toastal/github-less-social)

### Linux

#### Set default shell

```bash
`chsh` and type `$HOME/.nix-profile/bin/fish`

# or this one
`vi /etc/passwd` and specify shell for your user
```

#### Add nix path to sudo

`sudo vi /root/.bashrc`

```bash
export PATH="$PATH:/home/kahnwong/.nix-profile/bin"
```

### MacOS: Misc config

- set `tap to single click`
- set `three-finger drag`

## Useful commands

```bash
# backup vscode extensions list
code --list-extensions | xargs -L 1 echo code --install-extension > ext_install.sh

# backup vscode config
cp "/users/$USER/Library/Application Support/Code/User/keybindings.json" .
cp "/users/$USER/Library/Application Support/Code/User/settings.json" .
```
