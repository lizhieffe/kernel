## Must do after fresh install

```
systemctl enable dhcpcd.service   # enable wired network connection on bootup
systemctl start dhcpcd.service    # start wired network connection now
pacman -S base-devel git bc xmlto docbook-xsl kmod inetutils # install core development package, e.g., make, gcc
pacman -S git tmux bash-completion
```
