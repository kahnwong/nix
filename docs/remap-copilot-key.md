# Remap Copilot Key

```bash
sudo apt install keyd -y
sudo systemctl enable keyd --now
```

Create config:

```bash
# sudo vi /etc/keyd/default.conf

[ids]
*

[main]

[meta+shift]
f23 = S-f10
```

Then reload config:

```bash
sudo keyd.rvaiya reload
```
