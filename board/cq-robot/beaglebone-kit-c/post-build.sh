#!/bin/sh
BOARD_DIR="$(dirname $0)"

# boot mount point
grep -q "^/dev/mmcblk0p1" ${TARGET_DIR}/etc/fstab || \
echo "/dev/mmcblk0p1\t\t/boot\tvfat\tdefaults\t\t0\t0" \
     >> ${TARGET_DIR}/etc/fstab

grep -q "/sys/kernel/debug" ${TARGET_DIR}/etc/fstab || \
echo "nodev\t\t/sys/kernel/debug\tdebugfs\tdefaults\t\t0\t0" \
     >> ${TARGET_DIR}/etc/fstab

# Copy u-boot environment
cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt

# Copy the rootfs additions
cp -a ${BOARD_DIR}/rootfs-additions/* ${TARGET_DIR}/
