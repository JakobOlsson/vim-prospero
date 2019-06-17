#!/bin/env sh

# installing neovim
sudo dnf install -y neovim
#echo "alias vim=\"nvim\"" >> ~/.bashrc
#echo "alias vi=\"nvim\"" >> ~/.bashrc
mkdir -p  ~/.config/nvim/
# installing vim-plug plugin manager for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat <<'EOF' >> ~/.config/nvim/init.vim
  " Specify a directory for plugins
  " - For Neovim: ~/.local/share/nvim/plugged
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.local/share/nvim/plugged')
  " plugins go here
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-fugitive'
  Plug 'morhetz/gruvbox'
  # transperently edit gpg encrypted files
  Plug 'jamessan/vim-gnupg'
   " syntax check
  Plug 'w0rp/ale'
  " Initialize plugin system
  call plug#end()
  filetype plugin indent on
  colorscheme gruvbox
  " CHANGE LEADER KEY FROM DEFAUKT \ backslash
  let mapleader="," 
  " true colors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
  
  " TABS
  " se :help tapstop
  " for more info on how tabs work in vim
  set tabstop=2           " number of visual spaces per TAB
  set softtabstop=2       " number of spaces in tab when editing
  set shiftwidth=2
  set expandtab           " On pressing tag, tabs are spaces
  set smartindent         " Do smart autoindenting when starting a new line.
  set smarttab            " <Tab> respect shiftwidthm, tapsto and softtabstop
  set autoindent          " Normally 'autoindent' should also be on when using 'smartindent'
  
  " OVERRIDE INDENT FOR SPECIFIC FILETYPES
  "autocmd FileType cpp setlocal shiftwidth=3 " If filetype detection is c++, change autoint to 3 spaces
  
  "UI CONFIG
  syntax on               " syntax highlighting
  set number              " show line numbers
  set showcmd             " show command in bottom bar
  "set cursorline          " highlight current line
  set wildmenu            " visual autocomplete for command menu <Tab> to se list
  set showmatch           " highlight matching [{()}]
  set mouse=a             " enable mouse in terminal
  "SEARCHING
  set incsearch           " search as characters are entered
  set hlsearch            " highlight matches
  " Fix schemas
  " Allow color schemes to do bright colors without forcing bold.
  if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
    set t_Co=16
  endif
  
  " VIM WINDOW MANAGMENT
  " EASIER MOVING BETWEEN WINDOW
  " instead of using CTR+W h,j,k and l
  " using CTR+h,j,k and l
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  " CHANGE SO SPLIT GOEST TO THE RIGHT NOT LEFT AND BELOW
  set splitbelow
  set splitright
  
  " turn off search highlight
  nnoremap <leader><space> :nohlsearch<CR>
  "Vim will keep highlighted matches from searches until you either run a new
  "one or manually stop highlighting the old search with :nohlsearch. I find
  "myself running this all the time so I've mapped it to ,<space>.
  
  " COPY&PAST
  " Yank/Past work with XCLIPBOARD
  set clipboard=unnamedplus
  " KEY MAPPING FOR COPY&PASTE FROM SYSTEM CLIPBOARD
  noremap <Leader>y "*y
  noremap <Leader>p "*p
  noremap <Leader>Y "+y
  noremap <Leader>P "+p
  
  "FOLDING CODE
  set foldenable          " enable folding
  set foldlevelstart=10   " open most folds by default
  set foldnestmax=10      " 10 nested fold max
  " space open/closes folds
  nnoremap <space> za
  "I change the mapping of <space> pretty frequently, but this is its current
  "command. za opens/closes the fold around the current block. As an interesting
  "aside, I've heard the z character is used to represent folding in Vim because
  "it looks like a folded piece of paper. Probably not, but it makes a nice
  "story. :)
  set foldmethod=indent   " fold based on indent level
  "This tells Vim to fold based on indentation. This is especially useful for me
  "since I spend my days in Python. Other acceptable values are marker, manual,
  "expr, syntax, diff. Run :help foldmethod to find out what each of those do.
  "
  " detect filetypes, load plugins and use specific filetype indent
  filetype plugin indent on
  
  " MISC KEYMAPPS
  " make Y yank from cursor to EOL
  map Y y$
  " buffer
  set hidden
  " prev/next buffer shortcut
  nnoremap <Leader>n :bnext<CR>
  nnoremap <Leader>p :bprev<CR>
  " Exit to normal mode with ESC ESC, when in terminal :term
  tnoremap <ESC><ESC> <C-\><C-N>
  
  " command mode map movement keys to not depend on arrow keys
  cnoremap <C-k> <Up>
  cnoremap <C-j> <Down>
  cnoremap <C-h> <Left>
  cnoremap <C-l> <Right>
EOF
echo "Rembmer to run :PlugInstall inside neovim to actually install the plugins"
