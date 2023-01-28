# nix

Tested against:

- x86_64-linux
- aarch64-linux
- x86_64-darwin
- aarch64-darwin

## Notes

home_directory:

- linux: `/home/$username`
- mac: `/Users/$username`

## Usage

1. Create `.env` and populate variables (see list of env keys in `.enc.env`)
2. (Optional) If you don't want to set up commit signing, comment out the whole `git_signing_key` section.
3. On `Raspberry Pi 4`, comment out `nodePackages_latest.*`. It raises segmentation fault, not sure whether this applies to other `aarch64-linux` or not.
4. `make setup`
5. For Mac OS:
   1. Login to `App Store`
   2. `gh auth login`
   3. `make mac-extras`
6. If you need `tailscale`, `caddy`, `fail2ban`, or `docker` on your server, install it via your system's package manager, since nix requires you set up systemd services explicitly.

## Post Installation Instructions

### Add SSH key to GitHub

<https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>

### Set default shell (Linux only)

```bash
`chsh` and type `$HOME/.nix-profile/bin/fish`

# or this one
`vi /etc/passwd` and specify shell for your user
```

### Set iTerm2 config (Mac only)

- Import iTerm2 config (`iterm-config.json`)
- Preferences > Profile > General > Command, select `Custom Shell` from drop-down menu, and set value to `/Users/$USER/.nix-profile/bin/fish` # replace `$USER` with your username
- Preferences > general > profiles > general > working directory > select `Reuse previous session's directory`
- Preferences > Profile > Text > Font > select `MesloLGS Nerd Font Mono`

### Misc MacOS config

- set `tap to single click`
- set `three-finger drag`

## Upgrading

### Nix

```bash
# equivalent to apt-get update
nix-channel --update # then run `home-manager switch`

# equivalent to do-release-upgrade
https://nixos.org/manual/nix/stable/installation/upgrading.html
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

# nix garbage collection
nix-store --gc
```

## Flake (not used)

<https://github.com/mschwaig/howto-install-nix-with-flake-support>

```bash
nix flake show templates
nix flake init -t templates#trivial
nix flake init

nix build flake.nix
```
