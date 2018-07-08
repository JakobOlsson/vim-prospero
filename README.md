# vim
VIM - Resources, links, and extensions

### Tips:
* In _Terminal_ - go back to **Normal** mode when in **Insert** mode
`<C-\><C-n>` - See `:help terminal-emulator-input` for mapping suggestion
`tnoremap <ESC><ESC> <C-\><C-N> " Example remapping`
* Change _syntax highlighting_ for a specific FileName.Ext
```
  " set syntax to groovy for Jenkinsfile.*
  au BufNewFile,BufRead Jenkinsfile setf groovy
  au BufNewFile,BufRead Jenkinsfile.aws setf groovy
```
* Navigate _command-line_  - Standard mapping, and possible custom mappings

```
  CTRL-B or <Home>
          cursor to beginning of command-line
  CTRL-E or <End> 
          cursor to end of command-line
  CTRL-H              
  <BS>        Delete the character in front of the cursor (see |:fixdel| if
          your <BS> key does not do what you want).
  <Del>       Delete the character under the cursor (at end of line:
          character before the cursor).
  CTRL-W      Delete the |word| before the cursor.  This depends on the
          'iskeyword' option.
  CTRL-U      Remove all characters between the cursor position and
          the beginning of the line.  
```
```
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-k> <Up>
  cnoremap <C-j> <Down>
  cnoremap <C-h> <Left>
  cnoremap <C-l> <Right>
  cnoremap <M-b> <S-Left>
  cnoremap <M-f> <S-Right>
```
* Insert yanked text in _command-line_ - `<c-r>"` _think: Cmd register, last copied text_
* Command history - `:his<cr>`
* Browse command history - `q:` - browse with jk keys, execute with enter
---
### Plugins
[vim-airline](https://github.com/vim-airline/vim-airline) - Lean & mean status/tabline for vim that's light as air.

![vim-airline gif](https://github.com/JakobOlsson/vim-prospero/raw/master/img/vim-airline.gif)

[vim-fugitive](https://github.com/tpope/vim-fugitive) - Probably best Git wrapper - `:Gstatus` - `-` to add/reset a files changes, `:Gcommit`, `:Gblame`, `:Gread` - reload file, `:Gwrite` is like git add, `:Gsplit`, `:Gvsplit`
[vim-buftabline](https://github.com/ap/vim-buftabline) - Replace tabline with bufferlist

[vim-bufferline](https://github.com/bling/vim-bufferline) - List of buffers in the command bar || statusline

![bufferline statusline](https://github.com/JakobOlsson/vim-prospero/raw/master/img/bufferline-status.png)

[vim-sensible](https://github.com/tpope/vim-sensible) - A good sensible start for your vimrc

[comfortable-motion](https://github.com/yuttie/comfortable-motion.vim) - Smooth scrolling in vim

![comfortable-motion gif](https://github.com/JakobOlsson/vim-prospero/raw/master/img/comfortable-motion.gif)

[vim-virtualenv](https://github.com/jmcantrell/vim-virtualenv) - Handle python virtualenv, mostly use it to show current virtualenv in statusline

[nerdtree](https://github.com/scrooloose/nerdtree) - Filebrowser for vim

![nedtree](https://github.com/JakobOlsson/vim-prospero/raw/master/img/nedtree.png)

[command-t](https://github.com/wincent/command-t) - Command line style filebrowser for vim

![command-t gif](https://github.com/JakobOlsson/vim-prospero/raw/master/img/command-t.gif)

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) - Sublime Texts multiple selection done in vim - just stand on a word and hit `<C-n>` and then `c` and see the magic

![vim-multiple-cursors](https://github.com/JakobOlsson/vim-prospero/raw/master/img/vim-multiple-cursors.gif)


---

### Color schemas
[badwolf](https://github.com/sjl/badwolf)

[molokai](https://github.com/tomasr/molokai)

[vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

[seoul256](https://github.com/junegunn/seoul256.vim)

---
### Links:
[Vim Registers: The basics and beyond][1]  

[Never leave your terminal][2]  

[VimAwesome - Vim plugins list][3]  

[Arch Linux's entry on VIM][4]  

[1]: https://www.brianstorti.com/vim-registers/
[2]: https://chromatichq.com/blog/working-vim-never-leave-your-terminal
[3]: https://vimawesome.com/
[4]: https://wiki.archlinux.org/index.php/vim
