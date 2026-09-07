# Yubikey

<https://support.yubico.com/s/article/Ubuntu-Linux-login-guide-U2F>

## Setup

```bash
sudo apt install libpam-u2f pamu2fcfg

# register Yubikey
mkdir -p ~/.config/Yubico
pamu2fcfg > ~/.config/Yubico/u2f_keys
```

## For sudo with fallback to password auth

```bash
sudo vi /etc/pam.d/sudo
## put this BEFORE `@include common-auth`
auth sufficient pam_u2f.so nouserok cue
```

## For login with fallback to password auth

```bash
sudo vi /etc/pam.d/gdm-password
## put this BEFORE `@include common-auth`
auth sufficient pam_u2f.so
```
