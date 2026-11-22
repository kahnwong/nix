# LUKS

Setup during Ubuntu installation.

To apply rw speed increase, get `crypt` volume name:

```bash
lsblk -o NAME,TYPE,FSTYPE,MOUNTPOINT

# example output
nvme0n1                     disk
└─nvme0n1p3                 part  crypto_LUKS
└─dm_crypt-0              crypt LVM2_member
````

Then run:

```bash
sudo cryptsetup --perf-no_read_workqueue --perf-no_write_workqueue --persistent refresh dm_crypt-0
sudo update-initramfs -u
```

Verify that it's applied via:

```bash
sudo dmsetup table # see kernel flags
```
