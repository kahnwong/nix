# nix

## Usage

1. Edit `home.username` and `home.homeDirectory` in `home.nix`.
2. If you're on Mac, enable `ssh signing key` section in `home.nix`.
3. `make setup`
4. For Mac OS:
   1. Login to `App Store`
   2. `gh auth login`
   3. `make mac-extras`

## Useful commands

```bash
# backup vscode extensions list
code --list-extensions | xargs -L 1 echo code --install-extension > ext_install.sh

# backup vscode config
cp "/users/$USER/Library/Application Support/Code/User/keybindings.json" .
cp "/users/$USER/Library/Application Support/Code/User/settings.json" .
```

## Flake (not used)

<https://github.com/mschwaig/howto-install-nix-with-flake-support>

```bash
nix flake show templates
nix flake init -t templates#trivial
nix flake init

nix build flake.nix
```
