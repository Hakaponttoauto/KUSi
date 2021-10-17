echo "---- CLEARING FILESYSTEM ----"
rm ./rootfs/usr/* -rd
rm ./rootfs/share/* -rd
rm ./rootfs/lib/* -rd
rm ./rootfs/etc/* -rd
rm ./rootfs/bin/* -rd

mkdir ./temp_sources
cd ./temp_sources

zsh_url=http://ftp.funet.fi/pub/unix/shells/zsh/zsh-5.8.tar.xz
zsh=zsh-5.8

echo "---- DOWNLOADING ZSH ----"
wget -c $zsh_url

echo "---- UNPACKING ZSH ----"
tar -xf $zsh.tar.xz

cd $zsh

echo "---- BUILDING ZSH ----"
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
