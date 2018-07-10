#!/bin/env bash
# get pathogen installed for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# setup vimrc to load pathogen
touch ~/.vimrc && \
   echo "execute pathogen#infect()" > ~/.vimrc

# load filetype plugins, detect automatic and indent
echo "\" detect filetypes, load plugins and use specific filetype indent" >> ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc

# mapp leader key
echo "\"CHANGE LEADER KEY FROM DEFAUKT \\ backslash" >> ~/.vimrc
echo "let mapleader=\",\" " >> ~/.vimrc

# download prosperos vim config
cd ~/.vim/bundle && \
   git clone https://github.com/JakobOlsson/vim-prospero.git

# PLUGINS
# airline status line
cd ~/.vim/bundle && \
  git clone https://github.com/vim-airline/vim-airline.git 

# fugitive git plugin
cd ~/.vim/bundle && \
  git clone https://github.com/tpope/vim-fugitive.git 

# comfortable-motion - Smooth scrolling in vim
cd ~/.vim/bundle && \
  git clone https://github.com/yuttie/comfortable-motion.vim.git 

# vim-multiple-cursors - Sublime Texts multiple selection done in vim
cd ~/.vim/bundle && \
  git clone https://github.com/terryma/vim-multiple-cursors.git 

# nerdtree - filebrowser for vim
#cd ~/.vim/bundle && \
#  git clone https://github.com/scrooloose/nerdtree.git
# remapp nerdtree key
#echo "\"NERDTree Tab open/toggle" >> ~/.vimrc
#echo "nnoremap <Leader>e :NERDTreeToggle<CR>" >> ~/.vimrc


# color schemas / themes
cd ~/.vim/bundle && \
  git clone https://github.com/sjl/badwolf.git
cd ~/.vim/bundle && \
  git clone https://github.com/tomasr/molokai.git 
cd ~/.vim/bundle && \
  git clone https://github.com/altercation/vim-colors-solarized.git
cd ~/.vim/bundle && \
  git clone https://github.com/junegunn/seoul256.vim.git

# start using colorscheme badwolf
echo "colorscheme badwolf" >> ~/.vimrc
