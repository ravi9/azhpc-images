# Setup Image

sudo ./update_config.sh
./setup_ssh.sh
./install_dev_tools.sh
sudo ./install_ofed.sh
sudo ./install_gcc-8.2.sh
sudo ./install_mpi.sh

sudo mkdir -p /usr/share/Modules/mpi/
sudo cp ./modulefiles/* /usr/share/Modules/mpi/
