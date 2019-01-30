#!/bin/bash
set -x

# Install gcc 8.2

rm -rf /tmp/setup-gcc
mkdir -p /tmp/setup-gcc
cd /tmp/setup-gcc

#install prereqs
sudo yum install -y m4 libgcc.i686 glibc-devel.i686

wget ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-6.1.0.tar.bz2
tar -xvf gmp-6.1.0.tar.bz2
cd ./gmp-6.1.0
./configure && make -j 40 && sudo make install
cd ..

wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-3.1.4.tar.bz2
tar -xvf mpfr-3.1.4.tar.bz2
cd mpfr-3.1.4
./configure && make -j 40 && sudo make install
cd ..

wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-1.0.3.tar.gz
tar -xvf mpc-1.0.3.tar.gz
cd mpc-1.0.3
./configure && make -j 40 && sudo make install
cd ..

# install gcc 8.2
wget https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.gz
tar -xvf gcc-8.2.0.tar.gz
cd gcc-8.2.0
./configure --disable-multilib && make -j 40 && sudo make install
