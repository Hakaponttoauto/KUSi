cd ./OS
qemu-system-x86_64 -m 1G -kernel vmlinuz -initrd initramfs -append "init=/sbin/init rootfstype=ramfs debug" -serial stdio
