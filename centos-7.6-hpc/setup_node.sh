#!/bin/bash
set -ex

# Update memory limits, set hpcuser access
sudo ./update_config.sh

# Install development tools
./install_dev_tools.sh

# Install OFED, setup IPoIB, and WALinuxAgent
sudo ./install_ofed.sh

# Install gcc 8.2
sudo ./install_gcc-8.2.sh

# Install MPI libraries and Communication Runtimes
sudo ./install_mpi.sh

# Setup environment modules for MPI libraries
sudo mkdir -p /usr/share/Modules/modulefiles/mpi/
sudo cp ./modulefiles/* /usr/share/Modules/modulefiles/mpi/

