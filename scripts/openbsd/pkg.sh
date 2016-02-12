#!/bin/sh
set -e

export PKG_PATH=$PACKAGE_MIRROR/`uname -r`/packages/`arch -s`/
echo "installpath=${PKG_PATH}" > /tmp/pkg.conf
doas chown root:wheel /tmp/pkg.conf
doas mv /tmp/pkg.conf /etc/pkg.conf
