DOWNLOAD_URL=https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.14.12.tar.xz
LINUX=linux-5.14.12

cd ./temp_sources

echo  "---- DOWNLOADING KERNEL ----"
wget -c $DOWNLOAD_URL

echo  "---- UNPACKING KERNEL ----"
tar -xf $LINUX.tar.xz

echo  "---- BUILDING KERNEL ----"
cd $LINUX
make defconfig
make
cp ./arch/x86/boot/bzImage ../../OS/vmlinuz
cd ../..
