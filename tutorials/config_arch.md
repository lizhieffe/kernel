## Must do after fresh install

```
systemctl enable dhcpcd.service   # enable wired network connection on bootup
systemctl start dhcpcd.service    # start wired network connection now
pacman -S base-devel git bc xmlto docbook-xsl kmod inetutils # install core development package, e.g., make, gcc
pacman -S git tmux bash-completion
```

### Create user account

- Create the new user account: `useradd -m USER_NAME`
- Add sudo permission to the new account:

1. First login as root
2. `visudo -f /etc/sudoers`
3. Add this line `USER_NAME ALL=(ALL) ALL`
``` 

See [this](https://wiki.archlinux.org/index.php/Users_and_groups) and [this](https://wiki.archlinux.org/index.php/sudo) doc for more details.
