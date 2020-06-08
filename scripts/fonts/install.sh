#!/usr/bin/env sh
echo "Coping fonts"
cp Inconsolata Bold Nerd Font Complete Mono.otf ~/.local/share/fonts
cp Inconsolata Bold Nerd Font Complete.otf ~/.local/share/fonts
cp Inconsolata Regular Nerd Font Complete Mono.otf ~/.local/share/fonts
cp Inconsolata Regular Nerd Font Complete.otf ~/.local/share/fonts
echo "Clear an re-generate font cache"
fc-cache -f -v
