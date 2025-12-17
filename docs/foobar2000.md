# foobar2000

Download from <https://www.foobar2000.org/windows>. Has to be `32-bit` edition.


```bash
flatpak install flathub org.winehq.Wine
flatpak run org.winehq.Wine ~/Downloads/foobar2000-x64_v2.25.3.exe
```

## Might need this

```bash
flatpak run --command=winetricks org.winehq.Wine
```
