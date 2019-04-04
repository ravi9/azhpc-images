#!/bin/bash
# Install miniconda3, tensorflow, Horovod, tf_cnn_benchmarks

set -ex

export PATH=/opt/gcc-8.2.0/bin:$PATH
export LD_LIBRARY_PATH=/opt/gcc-8.2.0/lib64:$LD_LIBRARY_PATH
export CC=/opt/gcc-8.2.0/bin/gcc
export GCC=/opt/gcc-8.2.0/bin/gcc

export PATH=/opt/openmpi-4.0.0/bin:$PATH
export LD_LIBRARY_PATH=/opt/openmpi-4.0.0/lib:$LD_LIBRARY_PATH
export MANPATH=/opt/openmpi-4.0.0/share/man:$MANPATH
export MPI_BIN=/opt/openmpi-4.0.0/bin
export MPI_INCLUDE=/opt/openmpi-4.0.0/include
export MPI_LIB=/opt/openmpi-4.0.0/lib
export MPI_MAN=/opt/openmpi-4.0.0/share/man
export MPI_HOME=/opt/openmpi-4.0.0

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3

export PATH=/opt/miniconda3/bin:$PATH
rm -rf Miniconda3-latest-Linux-x86_64.sh

conda install -y tensorflow
pip install --no-cache-dir Horovod

export tfversion=$(python -c "import tensorflow as tf;print(tf.__version__)")
ver_rel_arr=(${tfversion//./ })  # Parse version and release
export version=${ver_rel_arr[0]}
export release=${ver_rel_arr[1]}

# Clone benchmark scripts for appropriate TF version
git clone -b cnn_tf_v${version}.${release}_compatible  https://github.com/tensorflow/benchmarks.git /opt/tensorflow-benchmarks
