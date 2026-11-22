# Gaming

## Launch Heroic Games via Steam

Edit launch command:

1. Change target to `/usr/bin/flatpak-spawn`
2. Prepend launch options with `--host flatpak run com.heroicgameslauncher.hgl`

### Fix Steam PATH for flatpak in Heroic Launcher

```text
/home/$USER/.var/app/com.valvesoftware.Steam/data/Steam
```
