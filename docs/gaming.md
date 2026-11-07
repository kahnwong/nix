# Gaming

## Heroic Launcher & Flatpak Steam

Edit launch command:

1. Change target to `/usr/bin/flatpak-spawn`
2. Prepend launch options with `--host flatpak run com.heroicgameslauncher.hgl`

To use Heroic Launcher with Flatpak's Steam, set steam path to:

```text
/home/$USER/.var/app/com.valvesoftware.Steam/data/Steam
```
