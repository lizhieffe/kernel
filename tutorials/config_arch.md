## Must do after fresh install

```
systemctl enable dhcpcd.service   # enable wired network connection on bootup
systemctl start dhcpcd.service    # start wired network connection now
pacman -S git                     # install git
pacman -S base-devel              # install core development package
```
