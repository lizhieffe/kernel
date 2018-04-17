# Build Kernel on Ubuntu 14

This tutorial lists the steps to build and install kernel on Ubuntu 14.

## Steps
1. If you want to build the kernel of the same version as that currently running
on your machines, check the version of your current system 

```
uname -a
```

2. Download the kernel source.

Go to directory /usr/src, and run

```
sudo apt-get source linux-image-{$KERNEL_VERSION}
```

For example, `sudo apt-get source linux-image-3.13.0-144-generic`

After the download finishes, you can see one new folder which contains the
source code, and three new files.

3. Prepare environment.

Install the necessary tools by running

```
sudo apt-get build-dep linux-image-{$KERNEL_VERSION}
```

4. Build and install kernel.

Follow this link: https://wiki.ubuntu.com/KernelTeam/GitKernelBuild

Note that the checkout name in linux git repository is like v3.13.1

## References
https://zhuanlan.zhihu.com/p/23248550
https://blog.csdn.net/tang152453/article/details/41170399
