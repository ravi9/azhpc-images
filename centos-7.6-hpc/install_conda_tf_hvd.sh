#!/bin/bash
# Install miniconda3, tensorflow, Horovod, tf_cnn_benchmarks

set -ex

yum install -y wget

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3

export PATH=/opt/anaconda3/bin:$PATH
rm -rf Miniconda3-latest-Linux-x86_64.sh

conda install -y tensorflow
pip install --no-cache-dir Horovod

export tfversion=$(python -c "import tensorflow as tf;print(tf.__version__)")
ver_rel_arr=(${tfversion//./ })  # Parse version and release
export version=${ver_rel_arr[0]}
export release=${ver_rel_arr[1]}

# Clone benchmark scripts for appropriate TF version
git clone -b cnn_tf_v${version}.${release}_compatible  https://github.com/tensorflow/benchmarks.git /opt/tensorflow-benchmarks
cd benchmarks/scripts/tf_cnn_benchmarks


#git clone -b cnn_tf_v1.10_compatible https://github.com/tensorflow/benchmarks /opt/tensorflow-benchmarks