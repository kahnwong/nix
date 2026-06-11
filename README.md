# nix

Flake migration based on <https://github.com/sebastiant/dotfiles>.

## Pre-requisites

Create `./scripts/apply.sh` and set appropriate build command. See `flake.nix` for available options.

File content should look like this:

```bash
#!/bin/bash

export NIXPKGS_ALLOW_UNFREE=1

## darwin
#nix build '.#homeManagerConfigurations.macbookMain.system' --experimental-features 'nix-command flakes' --impure
# linux
nix build '.#homeManagerConfigurations.base.activationPackage' --experimental-features 'nix-command flakes' --impure

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

or

```bash
rustup toolchain uninstall stable
rustup toolchain install stable
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

### Linux

#### Set default shell

```bash
`chsh` and type `$HOME/.nix-profile/bin/fish`

# or this one
`vi /etc/passwd` and specify shell for your user
```

#### Linux on Intel Apple

Install Wi-Fi driver:

```bash
sudo apt install broadcom-sta-dkms
```

### MacOS: Misc config

- set `tap to single click`
- set `three-finger drag`

### Crontab

```bash
@reboot /home/kahnwong/go/bin/workspace-init
```

## Useful commands

```bash
# backup vscode extensions list
code --list-extensions | xargs -L 1 echo code --install-extension > ext_install.sh

# backup vscode config
cp "/users/$USER/Library/Application Support/Code/User/keybindings.json" .
cp "/users/$USER/Library/Application Support/Code/User/settings.json" .
```
