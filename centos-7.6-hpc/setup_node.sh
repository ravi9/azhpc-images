#!/bin/bash
set -ex

# Update memory limits
./update_config.sh

# Install development tools
./install_dev_tools.sh

# Install OFED, setup IPoIB, and WALinuxAgent
./install_ofed.sh

# Install gcc 8.2
./install_gcc-8.2.sh

# Install MPI libraries and Communication Runtimes
./install_mpi.sh

# Setup environment modules for MPI libraries
mkdir -p /usr/share/Modules/modulefiles/mpi/
cp ./modulefiles/* /usr/share/Modules/modulefiles/mpi/

