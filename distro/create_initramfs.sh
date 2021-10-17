cd ./rootfs
find . | cpio -R root:root -H newc -o | xz -9 --check=none > ../OS/initramfs
cd ..
