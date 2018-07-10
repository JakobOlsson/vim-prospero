dnf -y install vim-enhanced
dnf -y install vim-command-t
dnf -y install fish
dnf -y install tilix
# nnn - command line file browser URL: https://github.com/jarun/nnn
dnf -y install nnn

pip install --user --upgrade pip 
pip install --user awscli
pip install --user boto3

echo "alias vim=\"vimx\"" >> ~/.bashrc
echo "alias vi=\"vimx\"" >> ~/.bashrc
echo "alias vim=\"vimx\"" >> ~/.config/fish/config.fish
echo "alias vi=\"vimx\"" >> ~/.config/fish/config.fish
echo "set -x SHELL /usr/bin/fish" >> ~/.config/fish/config.fish
echo "set -x EDITOR /usr/bin/vimx" >> ~/.config/fish/config.fish
echo "set -x PAGER /usr/bin/less" >> ~/.config/fish/config.fish
