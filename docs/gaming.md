# Gaming

## Launch Heroic Games via Steam

Edit launch command:

1. Change target to `/usr/bin/flatpak-spawn`
2. Prepend launch options with `--host flatpak run com.heroicgameslauncher.hgl`

### Fix Flatpak Steam PATH in Heroic Launcher

For adding Heroic Games to Steam

```text
/home/$USER/.var/app/com.valvesoftware.Steam/data/Steam
```
