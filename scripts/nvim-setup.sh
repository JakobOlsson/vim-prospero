#!/bin/env sh

# installing neovim
sudo dnf install -y neovim
# install python neovim module, needed for denite
sudo pip3 install pynvim
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
  " Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'morhetz/gruvbox'
  " Denite fuzzy search files and symbols
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  " transperently edit gpg encrypted files
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
  
  tnoremap <A-h> <C-\><C-N><C-w>h 
  tnoremap <A-j> <C-\><C-N><C-w>j 
  tnoremap <A-k> <C-\><C-N><C-w>k 
  tnoremap <A-l> <C-\><C-N><C-w>l 
  " command mode map movement keys to not depend on arrow keys
  cnoremap <C-k> <Up>
  cnoremap <C-j> <Down>
  cnoremap <C-h> <Left>
  cnoremap <C-l> <Right>
  " Wrap in try/catch to avoid errors on initial install before plugin is available
  try
  " === Denite setup ==="
  " Use ripgrep for searching current directory for files
  " By default, ripgrep will respect rules in .gitignore
  "   --files: Print each file that would be searched (but don't search)
  "   --glob:  Include or exclues files for searching that match the given glob
  "            (aka ignore .git files)
  "
  call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

  " Use ripgrep in place of "grep"
  call denite#custom#var('grep', 'command', ['rg'])

  " Custom options for ripgrep
  "   --vimgrep:  Show results with every match on it's own line
  "   --hidden:   Search hidden directories and files
  "   --heading:  Show the file name above clusters of matches from each file
  "   --S:        Search case insensitively if the pattern is all lowercase
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

  " Recommended defaults for ripgrep via Denite docs
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  " Remove date from buffer list
  call denite#custom#var('buffer', 'date_format', '')

  " Custom options for Denite
  "   auto_resize             - Auto resize the Denite window height automatically.
  "   prompt                  - Customize denite prompt
  "   direction               - Specify Denite window direction as directly below current pane
  "   winminheight            - Specify min height for Denite window
  "   highlight_mode_insert   - Specify h1-CursorLine in insert mode
  "   prompt_highlight        - Specify color of prompt
  "   highlight_matched_char  - Matched characters highlight
  "   highlight_matched_range - matched range highlight
  let s:denite_options = {'default' : {
  \ 'split': 'floating',
  \ 'start_filter': 1,
  \ 'auto_resize': 1,
  \ 'source_names': 'short',
  \ 'prompt': 'λ ',
  \ 'highlight_matched_char': 'QuickFixLine',
  \ 'highlight_matched_range': 'Visual',
  \ 'highlight_window_background': 'Visual',
  \ 'highlight_filter_background': 'DiffAdd',
  \ 'winrow': 1,
  \ 'vertical_preview': 1
  \ }}

  " Loop through denite options and enable them
  function! s:profile(opts) abort
    for l:fname in keys(a:opts)
      for l:dopt in keys(a:opts[l:fname])
        call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
      endfor
    endfor
  endfunction

  call s:profile(s:denite_options)
  catch
    echo 'Denite not installed. It should work after running :PlugInstall'
  endtry
  " === Denite shorcuts === "
  "   ;         - Browser currently open buffers
  "   <leader>t - Browse list of files in current directory
  "   <leader>g - Search current directory for occurences of given term and close window if no results
  "   <leader>j - Search current directory for occurences of word under cursor
  nmap ; :Denite buffer<CR>
  nmap <C-p> :DeniteProjectDir file/rec<CR>
  nmap <leader>t :DeniteProjectDir file/rec<CR>
  nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
  nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

  " Define mappings while in 'filter' mode
  "   <C-o>         - Switch to normal mode inside of search results
  "   <Esc>         - Exit denite window in any mode
  "   <CR>          - Open currently selected file in any mode
  "   <C-t>         - Open currently selected file in a new tab
  "   <C-v>         - Open currently selected file a vertical split
  "   <C-h>         - Open currently selected file in a horizontal split
  autocmd FileType denite-filter call s:denite_filter_my_settings()
  function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o>
    \ <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
    inoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    inoremap <silent><buffer><expr> <C-t>
    \ denite#do_map('do_action', 'tabopen')
    inoremap <silent><buffer><expr> <C-v>
    \ denite#do_map('do_action', 'vsplit')
    inoremap <silent><buffer><expr> <C-h>
    \ denite#do_map('do_action', 'split')
  endfunction
  " Define mappings while in denite window
  "   <CR>        - Opens currently selected file
  "   q or <Esc>  - Quit Denite window
  "   d           - Delete currenly selected file
  "   p           - Preview currently selected file
  "   <C-o> or i  - Switch to insert mode inside of filter prompt
  "   <C-t>       - Open currently selected file in a new tab
  "   <C-v>       - Open currently selected file a vertical split
  "   <C-h>       - Open currently selected file in a horizontal split
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <C-o>
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <C-t>
    \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> <C-v>
    \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-h>
    \ denite#do_map('do_action', 'split')
  endfunction
EOF
echo "Rembmer to run :PlugInstall inside neovim to actually install the plugins"
