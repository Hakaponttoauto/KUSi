

mkdir ./temp_sources
cd ./temp_sources

libc_url=https://musl.libc.org/releases/musl-1.2.2.tar.gz
libc=musl-1.2.2

echo "---- DOWNLOADING MUSL ----"
wget -c $libc_url

echo "---- UNPACKING MUSL ----"
tar -xf $libc.tar.gz

cd $libc

mkdir tempfs

echo "---- BUILDING MUSL ----"
./configure --prefix="$(realpath ./tempfs/usr/)" --syslibdir="$(realpath ./tempfs/lib)"
make
make install

cp -r ./tempfs/usr/* ../../rootfs/usr


cd ..


sh_url=http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.tar.gz
sh=dash-0.5.11

echo "---- DOWNLOADING DASH ----"
wget -c $sh_url

echo "---- UNPACKING DASH ----"
tar -xf $sh.tar.gz

cd $sh

echo "---- BUILDING DASH ----"
mkdir tempfs

./configure --exec-prefix=$(realpath ./tempfs) --prefix=$(realpath ./tempfs/usr/local)
make
make install

cp -r ./tempfs/* ../../rootfs/

cd ..

lua_url=https://luajit.org/download/LuaJIT-2.0.5.tar.gz
lua=LuaJIT-2.0.5

echo "---- DOWNLOADING LUA ----"
wget -c $lua_url

echo "---- UNPACKING LUA ----"
tar -xf $lua.tar.gz

cd $lua

echo "---- BUILDING LUA ----"
mkdir tempfs
make PREFIX="$(realpath ./tempfs/)"
make install DESTDIR="$(realpath ./tempfs/)"

cp -r ./tempfs/usr/local/* ../../rootfs/usr


cd ..

busybox_url=https://busybox.net/downloads/busybox-1.34.1.tar.bz2
busybox=busybox-1.34.1

echo "---- DOWNLOADING BUSYBOX ----"
wget -c $busybox_url

echo "---- UNPACKING BUSYBOX ----"
tar -xf $busybox.tar.bz2

cd $busybox

mkdir tempfs

echo "---- BUILDING BUSYBOX ----"
echo "SIKE! Build it yourself!"


cd ..

