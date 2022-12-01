# nix

Tested against:

- x86_64-linux
- aarch64-linux
- x86_64-darwin
- aarch64-darwin

## Usage

1. Edit `home.username` and `home.homeDirectory` in `./home.nix`.
2. Edit `userName` and `userEmail` in `programs.git` block in `./home.nix`.
3. If you are on `Mac` and want to set up ssh key signing, edit value `user.signingkey` in `git_signing_key` section in `./home.nix`,
   - If you don't want to set up commit signing, comment out the whole `git_signing_key` section.
4. On `Raspberry Pi 4`, comment out `nodePackages_latest.*`. It raises segmentation fault, not sure whether this applies to other `aarch64-linux` or not.
5. `make setup`
6. For Mac OS:
   1. Login to `App Store`
   2. `gh auth login`
   3. `make mac-extras`

## Post Installation Instructions

### Add SSH key to GitHub

<https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>

### Set default shell (Linux only)

```bash
`chsh` and type `/usr/bin/fish`
```

### Set iTerm2 config (Mac only)

- Import iTerm2 config (`iterm-config.json`)
- Preferences > Profile > General > Command, select `Custom Shell` from drop-down menu, and set value to `/Users/$USER/.nix-profile/bin/fish` # replace `$USER` with your username
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
