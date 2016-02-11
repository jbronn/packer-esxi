#!/bin/sh
set -e

mkdir -m 0700 -p ~/.ssh
cat /tmp/authorized_keys > ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

if [ "$(uname -s)" = 'OpenBSD' ]; then
    doas rm /tmp/authorized_keys
else
    sudo rm /tmp/authorized_keys
fi
