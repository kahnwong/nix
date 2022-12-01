# nix

## Usage

1. Edit `home.username` and `home.homeDirectory` in `home.nix`.
2. `make setup`
3. For Mac OS:
   1. Login to `App Store`
   2. `gh auth login`
   3. `make mac-extras`

## Post Installation Instructions

### Add SSH key to GitHub

<https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>

### Set iTerm2 config (Mac only)

- Import iTerm2 config (`iterm-config.json`)
- Preferences > Profile > General > Command, select `Custom Shell` from drop-down menu, and set value to `/Users/$USER/.nix-profile/bin/fish` # replace $USER with your username
- Preferences > general > profiles > general > working directory > select `Reuse previous session's directory`
- Preferences > Profile > Text > Font > select `MesloLGS Nerd Font Mono`

### Misc MacOS config

- set `tap to single click`
- set `three-finger drag`

## Useful commands

```bash
# backup vscode extensions list
code --list-extensions | xargs -L 1 echo code --install-extension > ext_install.sh

# backup vscode config
cp "/users/$USER/Library/Application Support/Code/User/keybindings.json" .
cp "/users/$USER/Library/Application Support/Code/User/settings.json" .

# equivalent to apt-get update
nix-channel --update
```

## Flake (not used)

<https://github.com/mschwaig/howto-install-nix-with-flake-support>

```bash
nix flake show templates
nix flake init -t templates#trivial
nix flake init

nix build flake.nix
```
