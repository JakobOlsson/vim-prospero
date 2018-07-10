dnf -y install vim-enhanced
dnf -y install vim-command-t
dnf -y install fish
dnf -y install tilix

pip install --user --upgrade pip 
pip install --user awscli
pip install --user boto3

echo "alias vim=\"vimx\"" >> ~/.bashrc
echo "alias vi=\"vimx\"" >> ~/.bashrc
echo "alias vim=\"vimx\"" >> ~/.config/fish/config.fish
echo "alias vi=\"vimx\"" >> ~/.config/fish/config.fish
