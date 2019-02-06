#!/bin/bash
# Install communication runtimes and MPI libraries

set -ex

INSTALL_PREFIX=/opt

mkdir -p /tmp/mpi
cd /tmp/mpi

# MVAPICH2 2.3
wget http://mvapich.cse.ohio-state.edu/download/mvapich/mv2/mvapich2-2.3.tar.gz
tar -xvf mvapich2-2.3.tar.gz
cd mvapich2-2.3
./configure --prefix=${INSTALL_PREFIX}/mvapich2-2.3 --enable-g=none --enable-fast=yes && make -j 40 && make install
cd ..

# UCX 1.5.0 RC1
wget https://github.com/openucx/ucx/releases/download/v1.5.0-rc1/ucx-1.5.0.tar.gz
tar -xvf ucx-1.5.0.tar.gz 
cd ucx-1.5.0
./contrib/configure-release --prefix=${INSTALL_PREFIX}/ucx-1.5.0 && make -j 40 && make install
cd ..

# HPC-X v2.3.0
cd ${INSTALL_PREFIX}
wget http://www.mellanox.com/downloads/hpc/hpc-x/v2.3/hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64.tbz
tar -xvf hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64.tbz
HPCX_PATH=${INSTALL_PREFIX}/hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64
HCOLL_PATH=${HPCX_PATH}/hcoll
rm -rf hpcx-v2.3.0-gcc-MLNX_OFED_LINUX-4.5-1.0.1.0-redhat7.6-x86_64.tbz
cd /tmp/mpi

# OpenMPI 4.0.0
wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.0.tar.gz
tar -xvf openmpi-4.0.0.tar.gz
cd openmpi-4.0.0
./configure --prefix=${INSTALL_PREFIX}/openmpi-4.0.0 --with-ucx=${INSTALL_PREFIX}/ucx-1.5.0 --enable-mpirun-prefix-by-default && make -j 40 && make install 
cd ..

# MPICH 3.3
wget http://www.mpich.org/static/downloads/3.3/mpich-3.3.tar.gz
tar -xvf mpich-3.3.tar.gz
cd mpich-3.3
./configure --prefix=${INSTALL_PREFIX}/mpich-3.3 --with-ucx=${INSTALL_PREFIX}/ucx-1.5.0 --with-hcoll=${HCOLL_PATH} --enable-g=none --enable-fast=yes --with-device=ch4:ucx   && make -j 8 && make install 
cd ..

cd && rm -rf /tmp/mpi
