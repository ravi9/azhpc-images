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

gcc_path="export PATH=/opt/gcc-8.2.0/bin:$PATH 
export LD_LIBRARY_PATH=/opt/gcc-8.2.0/lib64:$LD_LIBRARY_PATH 
export CC=/opt/gcc-8.2.0/bin/gcc 
export GCC=/opt/gcc-8.2.0/bin/gcc"

#set gcc_path in the current session
$gcc_path
#set gcc_path in the future sessions
echo -e "$gcc_path" >> ~/.bashrc

#Install Singularity
./install_singularity.sh

# Install UCX1.5 and OPENMPI4.0 libraries
./install_ucx_ompi.sh

openmpi_path="export PATH=/opt/openmpi-4.0.0/bin:$PATH 
export LD_LIBRARY_PATH=/opt/openmpi-4.0.0/lib:$LD_LIBRARY_PATH 
export MANPATH=/opt/openmpi-4.0.0/share/man:$MANPATH 
export MPI_BIN=/opt/openmpi-4.0.0/bin 
export MPI_INCLUDE=/opt/openmpi-4.0.0/include 
export MPI_LIB=/opt/openmpi-4.0.0/lib 
export MPI_MAN=/opt/openmpi-4.0.0/share/man 
export MPI_HOME=/opt/openmpi-4.0.0"

#set openmpi_path in the future sessions
echo -e "$openmpi_path"  >> ~/.bashrc

echo -e "
########################################################
Run 'source ~/.bashrc' to set paths for GCC and OPENMPI 
######################################################## "
