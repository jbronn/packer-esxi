#!/bin/bash
set -ex

# Install Puppet via Gems
echo "gem: --no-rdoc --no-ri --bindir /usr/local/bin
:sources:
 - ${GEM_MIRROR}" >> /tmp/gemrc
sudo mv -v /tmp/gemrc /etc/gemrc
sudo gem install -v 3.8.5 -V puppet
sudo rm /etc/gemrc
