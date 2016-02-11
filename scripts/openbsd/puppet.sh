#!/bin/sh
set -e

# Install Puppet
doas pkg_add gtar--
doas pkg_add puppet

# Move patched Puppet provider from temporary location.
doas mv /tmp/openbsd.rb /usr/local/lib/ruby/site_ruby/2.2/puppet/provider/package/openbsd.rb
doas chown root:wheel /usr/local/lib/ruby/site_ruby/2.2/puppet/provider/package/openbsd.rb
