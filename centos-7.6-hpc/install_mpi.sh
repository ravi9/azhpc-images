#!/bin/bash
# Install communication runtimes and MPI libraries

set -ex

INSTALL_PREFIX=/opt
cd ${INSTALL_PREFIX}


# MVAPICH2 2.3
wget http://mvapich.cse.ohio-state.edu/download/mvapich/mv2/mvapich2-2.3.tar.gz
tar -xvf mvapich2-2.3.tar.gz
cd mvapich2-2.3
./configure --prefix=$PWD.install --enable-g=none --enable-fast=yes && make -j 40 && make install
cd ..
rm -rf mvapich2-2.3.tar.gz


# UCX 1.5.0 RC1
wget https://github.com/openucx/ucx/releases/download/v1.5.0-rc1/ucx-1.5.0.tar.gz
tar -xvf ucx-1.5.0.tar.gz 
cd ucx-1.5.0
./contrib/configure-release --prefix=${PWD}.install && make -j 40 && make install
cd ..
rm -rf ucx-1.5.0.tar.gz


# HPC-X v2.3.0
wget http://www.mellanox.com/downloads/hpc/hpc-x/v2.3/hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64.tbz
tar -xvf hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64.tbz
HPCX_PATH=${INSTALL_PREFIX}/hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64
HCOLL_PATH=${HPCX_PATH}/hcoll
rm -rf hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64.tbz


# OpenMPI 4.0.0
wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.0.tar.gz
tar -xvf openmpi-4.0.0.tar.gz
cd openmpi-4.0.0
./configure --prefix=${PWD}.install --with-ucx=${INSTALL_PREFIX}/ucx-1.5.0.install --enable-mpirun-prefix-by-default && make -j 40 && make install 
cd ..
rm -rf openmpi-4.0.0.tar.gz


# MPICH 3.3
wget http://www.mpich.org/static/downloads/3.3/mpich-3.3.tar.gz
tar -xvf mpich-3.3.tar.gz
cd mpich-3.3
./configure --prefix=$PWD.install --with-ucx=${INSTALL_PREFIX}/ucx-1.5.0.install --with-hcoll=${HCOLL_PATH} --enable-g=none --enable-fast=yes --with-device=ch4:ucx   && make -j 8 && make install 
cd ..
rm -rf mpich-3.3.tar.gz

