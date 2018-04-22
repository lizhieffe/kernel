#/bin/sh

KERNEL_DIR="/root/development/linux"
echo "Going to kernel directory: ${KERNEL_DIR}"
cd "$KERNEL_DIR"

# git checkout v4.15

echo "Cleaning env..."
make clean

echo "Generating .config file"
rm .config
zcat /proc/config.gz > .config

KERNEL_NAME="linux-custom"
CORES=`getconf _NPROCESSORS_ONLN`

echo "Compiling the kernel with name ${KERNEL_NAME} using ${CORES} cores..."
make -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"

echo "Compiling the modules with using ${CORES} cores..."
make modules_install -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"

echo "Copying the kernel binary to /boot directory..."
cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-"$KERNEL_NAME"

echo "Making initial RAM disk..."
cp /etc/mkinitcpio.d/linux.preset /etc/mkinitcpio.d/"$KERNEL_NAME".preset
sed -i -E "s#ALL_kver=\".*\"#ALL_kver=\"/boot/vmlinuz-${KERNEL_NAME}\"#g" /etc/mkinitcpio.d/"$KERNEL_NAME".preset
sed -i -E "s#default_image=\".*\"#default_image=\"/boot/initramfs-${KERNEL_NAME}.img\"#g" /etc/mkinitcpio.d/"$KERNEL_NAME".preset
sed -i -E "s#fallback_image=\".*\"#fallback_image=\"/boot/initramfs-${KERNEL_NAME}-fallback.img\"#g" /etc/mkinitcpio.d/"$KERNEL_NAME".preset
mkinitcpio -p "$KERNEL_NAME"

echo "Updating grub config file..."
grub-mkconfig -o /boot/grub/grub.cfg

echo "The kernel is built and installed successfully. Please reboot and select the new kernel in the grub UI"
