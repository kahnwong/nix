# nix

<https://github.com/mschwaig/howto-install-nix-with-flake-support>

## Flake (not used)

```bash
nix flake show templates
nix flake init -t templates#trivial
nix flake init

nix build flake.nix
```

## todo

- add pre-commit
- `set -g NIX_PATH $HOME/.nix-defexpr/channels` # this is the config for fish shell
- sed `username` and `homedirectory`
