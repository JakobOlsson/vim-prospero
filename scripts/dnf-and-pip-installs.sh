# vim with clipboard support
dnf -y install vim-enhanced
# nice vim plugin for search/brows/open files <Leader>t
dnf -y install vim-command-t
# fish - a nice shell
dnf -y install fish
# tiled terminal emulator for gnome
dnf -y install tilix
# nnn - command line file browser URL: https://github.com/jarun/nnn
dnf -y install nnn
# source highlighting helper - to get source highlight in less
dnf -y install highlight

# aws development
pip install --user --upgrade pip 
pip install --user awscli
pip install --user boto3

echo "alias vim=\"vimx\"" >> ~/.bashrc
echo "alias vi=\"vimx\"" >> ~/.bashrc
echo "alias vim=\"vimx\"" >> ~/.config/fish/config.fish
echo "alias vi=\"vimx\"" >> ~/.config/fish/config.fish
# setup for nnn
echo "set -x SHELL /usr/bin/fish" >> ~/.config/fish/config.fish
echo "set -x EDITOR /usr/bin/vimx" >> ~/.config/fish/config.fish
echo "set -x PAGER /usr/bin/less" >> ~/.config/fish/config.fish
# setup for source highlight in less
echo "set -x LESSOPEN \"| /usr/bin/highlight %s --out-format xterm256 --line-numbers --quiet --force --style molokai\"" >> ~/.config/fish/config.fish
echo "set -x LESS ' -R '" >> ~/.config/fish/config.fish
echo "alias more=\"less\"" >> ~/.config/fish/config.fish 

# powerline
# dnf -y install powerline powerline-fonts
# echo "set fish_function_path $fish_function_path \"/usr/share/powerline/fish\"" >> ~/.config/fish/config.fish
# powerline-setup >> ~/.config/fish/config.fish 

