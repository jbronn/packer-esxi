#!/bin/sh
set -e

doas pkg_add bash
doas pkg_add colorls

# Change our shell.
doas usermod -s /usr/local/bin/bash $ADMIN_USERNAME

# Shell niceties.
cat <<'EOF' >> ~/.bashrc
# Aliases
alias c='clear'
alias ls='colorls -G'
alias l='ls'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -a'
alias sudo='doas'

# Minimalist path (e.g., no X11, games) for server systems.
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/libexec

# Define default prompt.
PS1='\u@\h:\w\$ '
EOF

echo 'test -r ~/.bashrc && source ~/.bashrc' > ~/.bash_profile
