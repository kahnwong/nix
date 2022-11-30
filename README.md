# nix

## Usage

1. Edit `home.username` and `home.homeDirectory` in `home.nix`.
2. `make setup`
3. `make install`

## todo

- add pre-commit
- `set -g NIX_PATH $HOME/.nix-defexpr/channels` # this is the config for fish shell

## Flake (not used)

<https://github.com/mschwaig/howto-install-nix-with-flake-support>

```bash
nix flake show templates
nix flake init -t templates#trivial
nix flake init

nix build flake.nix
```
