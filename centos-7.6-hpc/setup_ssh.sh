#!/bin/bash

set -ex

ssh-keygen -f /home/$USER/.ssh/id_rsa -t rsa -N ''
cat << EOF > /home/$USER/.ssh/config
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    PasswordAuthentication no
    LogLevel QUIET
EOF

cat /home/$USER/.ssh/id_rsa.pub >> /home/$USER/.ssh/authorized_keys
chmod 644 /home/$USER/.ssh/config
chmod 644 /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER/.ssh/*
