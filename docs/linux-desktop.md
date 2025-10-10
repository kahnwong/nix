# Linux Desktop

## Configs

- If you install linux on mac devices, install gnome-tweaks (`sudo apt install gnome-tweaks`) to remap super and alt
  button.
- Add m4a support to RhythmBox: `sudo apt install gstreamer1.0-fdkaac -y`
- `CopyQ`: set shortcut to `alt + shift + v` for `show the tray menu`

## Set symlinks

```bash
ln -s /mnt/ssd/Git ~/Git
ln -s /mnt/hdd/Downloads ~/Downloads
ln -s /mnt/hdd/Kooha ~/Videos/Kooha
```

## Gnome extensions

You probably need to install `gnome-browser-connector` and use chrome to install gnome extensions.

- [Hot Edge](https://extensions.gnome.org/extension/4222/hot-edge/)
- [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/)

## Fonts

You don't need this for Ghostty, but intellij terminal needs this to render glyphs properly.

- For nerd fonts, download fonts from [here](https://github.com/ryanoasis/nerd-fonts/releases), put them in
  `~/.local/share/fonts` (or `~/.fonts`) then run `fc-cache -fv`.
- Fix Thai fonts: `sudo apt install fonts-thai-tlwg -y`

## Mouse

- To setup custom mouse buttons: <https://github.com/pwr-Solaar/Solaar>.
- For some mice, use <https://github.com/libratbag/piper/issues/352#issuecomment-1147626332>.
    - If you need newer libratbag: `flatpak install flathub org.freedesktop.Piper -y`
    - See this if got errors: <https://github.com/libratbag/libratbag/issues/981>

## Notifications Mirroring

- iOS: <https://github.com/impiaaa/ios-notif-forward>

## App Errors

- Fix discord not loading: `rm -rf ~/.var/app/com.discordapp.Discord`
