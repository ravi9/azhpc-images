#!/bin/bash
set -ex

# Install pre-reqs and development tools
sudo yum groupinstall -y "Development Tools"
sudo yum install -y numactl numactl-devel libxml2-devel byacc environment-modules
sudo yum install -y python-devel redhat-rpm-config rpm-build
sudo yum install -y gtk2 atk cairo tcl tk createrepo emacs

