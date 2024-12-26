# Tailscale / Headscale

Allow using Mullvad in conjunction with tailscale/headscale.

Ref: <https://theorangeone.net/posts/tailscale-mullvad/>

!!IMPORTANT!! Can't use with official Mullvad client. Wireguard works though.

## Install

```bash
curl -fsSL https://tailscale.com/install.sh | sh
```

## Usage

Copy `./mullvad_tailscale.conf` to `/etc/nftables/mullvad_tailscale.conf`. Then edit `/etc/nftables.conf` and add following line:

```config
include "/etc/nftables/mullvad_tailscale.conf"
```

Then restart via: `sudo systemctl restart nftables`

## Verify that Mullvad is active

```bash
./is_mullvad_active.sh
```

## Useful commands

```bash
# apply config (does not persist across reboots)
sudo nft -f mullvad_tailscale.conf

# remove config
sudo nft delete table inet mullvad_tailscale
```
