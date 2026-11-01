# fprintd

Ref: <https://linuxvox.com/blog/linux-fingerprint-reader-ubuntu/>

```bash
fprintd-enroll
```

## Use fingerprint for sudo

```bash
sudo pam-auth-update # enable `Fingerprint authentication`
```

## Fix fprintd inactive after suspend

```bash
sudo vi /lib/systemd/system-sleep/fingerprint-wakeup.sh
```

```bash
#!/bin/bash

case "$1/$2" in
    post/*)
        # Restart the appropriate service on resume
        # Use only one of the lines below, based on your working service:
        /usr/bin/systemctl restart fprintd.service
        # /usr/bin/systemctl restart python3-validity.service
        ;;
esac
```

```bash
sudo chmod +x /lib/systemd/system-sleep/fingerprint-wakeup.sh
```

Then reboot.
