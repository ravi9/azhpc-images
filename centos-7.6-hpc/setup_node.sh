#!/bin/bash
set -ex

# Install Development Tools
./install_dev_tools.sh

# Install gcc 8.2
./install_gcc-8.2.sh

# Install OFED and setup IPoIB
./install_ofed.sh

# Install MPI Libraries and Communication Runtimes
./install_mpi.sh

