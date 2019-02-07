#!/bin/bash
set -ex

# Install pre-reqs and development tools
yum groupinstall -y "Development Tools"
yum install -y numactl numactl-devel libxml2-devel byacc environment-modules
yum install -y python-devel python-setuptools redhat-rpm-config rpm-build
yum install -y gtk2 atk cairo tcl tk createrepo emacs

yum install -y redhat-rpm-config rpm-build gcc-gfortran gcc-c++
yum install -y gtk2 atk cairo tcl tk createrepo wget
KERNEL=$(uname -r)
yum install -y kernel-devel-${KERNEL}
yum install -y m4 libgcc.i686 glibc-devel.i686

