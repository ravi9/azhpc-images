#!/bin/bash

set -ex

cat << EOF >> /etc/security/limits.conf
*               hard    memlock         unlimited
*               soft    memlock         unlimited
*               soft    nofile          65535
*               soft    nofile          65535
EOF

# Don't require password for HPC user sudo
echo "hpcuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sudo  yum install -y nfs-utils
sed -i 's/GSS_USE_PROXY="yes"/GSS_USE_PROXY="no"/g' /etc/sysconfig/nfs

cp /etc/sysctl.conf /tmp/sysctl.conf
echo "vm.zone_reclaim_mode = 1" >> /tmp/sysctl.conf
sudo cp /tmp/sysctl.conf /etc/sysctl.conf
sudo sysctl -p

