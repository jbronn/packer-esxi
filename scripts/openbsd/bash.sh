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

# Define default prompt to <username>@<hostname>:<path><"($|#) ">
# and print '#' for user "root" and '$' for normal users.
PS1='${LOGNAME}@$(/bin/hostname -s):$(
    [[ "${LOGNAME}" == "root" ]] && printf "%s" "${PWD/${HOME}/~}# " ||
    printf "%s" "${PWD//${HOME}/~}\$ ")'
EOF

echo 'test -r ~/.bashrc && source ~/.bashrc' > ~/.bash_profile
