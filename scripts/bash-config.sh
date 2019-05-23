#!/bin/env sh
echo "Creating .bashrc"
cat <<'EOF' > ~/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less
export SHELL=/usr/bin/bash

# POWERLINE bash
source /usr/share/powerline/bash/powerline.sh
EOF

