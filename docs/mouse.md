# Mouse

- To setup custom mouse buttons: <https://github.com/pwr-Solaar/Solaar>.
- For some mice, use <https://github.com/libratbag/piper/issues/352#issuecomment-1147626332>.

## Installing libratbag

If you run into errors: <https://github.com/libratbag/libratbag/issues/981>

```bash
sudo apt-get install meson ninja-build -y
sudo apt-get install libudev-dev libevdev-dev libglib2.0-dev libjson-glib-dev libunistring-dev libsystemd-dev swig check valgrind python3-dev python3-evde

git clone https://github.com/libratbag/libratbag.git
cd libratbag

meson builddir --prefix=/usr
meson configure builddir -Dsystemd-unit-dir=/usr/lib/systemd/system
ninja -C builddir
sudo ninja -C builddir install

sudo systemctl daemon-reload
sudo systemctl reload dbus.service
sudo systemctl enable ratbagd.service

flatpak install flathub org.freedesktop.Piper -y
```
