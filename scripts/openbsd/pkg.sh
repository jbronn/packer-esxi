#!/bin/sh
set -e

export PKG_PATH=http://ftp3.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`arch -s`/
echo "installpath=${PKG_PATH}" > /tmp/pkg.conf
doas chown root:wheel /tmp/pkg.conf
doas mv /tmp/pkg.conf /etc/pkg.conf
