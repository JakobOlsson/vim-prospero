#!/bin/env sh
# vim with clipboard support
sudo dnf -y install vim-enhanced
sudo dnf -y install vim-X11
# nice vim plugin for search/brows/open files <Leader>t
sudo dnf -y install vim-command-t
# install neovim
sudo dnf -y install neovim
# fish - a nice shell
sudo dnf -y install fish
# tiled terminal emulator for gnome
sudo dnf -y install tilix
# install tmux - tiled terminal
sudo dnf -y install tmux
# nnn - command line file browser URL: https://github.com/jarun/nnn
sudo dnf -y install nnn
# install xsel for xclipboard tool
sudo dnf -y install xsel
# source highlighting helper - to get source highlight in less
sudo dnf -y install highlight
# powerline shell statusline
sudo dnf -y install powerline powerline-fonts
# dash-to-dock gnome extension
sudo dnf -y install gnome-shell-extension-dash-to-dock
# smart card support (gpg smartcard)
sudo dnf -y install pcsc-tools pcsc-lite
sudo systemctl enable pcscd
sudo systemctl start pcscd
# install gnu password manager
sudo dnf -y install pass qrencode xclip pass-otp loboath oathtool 
# install zbar to decode qrcode images like for otp
sudo dnf -y install zbar
# ripgrep - a better grep
sudo dnf -y install ripgrep
# fuzzy file searcher fzf
sudo dnf -y install fzf
