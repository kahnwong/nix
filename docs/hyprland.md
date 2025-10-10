# Hyprland

<https://github.com/JaKooLit/Ubuntu-Hyprland>  # each distro has its own setup script

Reload config via: `hyprctl reload`

Todo:

- set mouse button bindings to switch workspace
- set startup apps

Issues:

- Wonky on NVIDIA, tried installing `libnvidia-egl-wayland1` but some apps won't render.
- You probably have to enable wayland socket via flatseal for some apps

```bash
## set default browser
xdg-settings set default-web-browser firefox_firefox.desktop  # probably different .desktop file on other distro

## vi ~/.config/hypr/UserConfigs/UserKeybinds.conf
- change default file manager to `dolphin`
- change default terminal to `ghostty`

## vi ~/.config/hypr/UserConfigs/UserSettings.conf
- add kb_layout: `th`
- add kb_options: `grp:ctrl_space_toggle`

# if on macbook, add to kb_options: `,altwin:swap_alt_win`

## vi ~/.config/hypr/hyprland.conf
# clipboard
exec-once = wl-paste --type text --watch cliphist store # Stores only text data
exec-once = wl-paste --type image --watch cliphist store # Stores only image data

bind = SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy

# screenshot
windowrule = noanim, class:^(flameshot)$
windowrule = float, class:^(flameshot)$
windowrule = move 0 0, class:^(flameshot)$
windowrule = pin, class:^(flameshot)$
windowrule = monitor 1, class:^(flameshot)$

bind = SUPER, X, exec, XDG_CURRENT_DESKTOP=sway /var/lib/flatpak/exports/bin/org.flameshot.Flameshot gui

# lockscreen
bind = $mainMod, L, exec, pactl set-sink-mute @DEFAULT_SINK@ 1 && hyprlock # Mute and lock the system
```
