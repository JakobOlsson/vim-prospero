#!/bin/env sh
echo "alias vim=\"vimx\"" >> ~/.bashrc
echo "alias vi=\"vimx\"" >> ~/.bashrc
mkdir -p  ~/.config/fish/
cat <<'EOF' >> ~/.config/fish/config.fish
  # use VIM Extended/Enhanced
  alias vim="vimx"
  alias vi="vimx"

  # SET GLOBAL ENV VARIABLES
  set -x SHELL /usr/bin/fish 
  set -x EDITOR /usr/bin/vimx
  set -x PAGER /usr/bin/less 

  # SETUP FOR SYNTAX HIGHLIGHT IN LESS
  set -x LESSOPEN "| /usr/bin/highlight %s --out-format xterm256 --line-numbers --quiet --force --style molokai" 
  set -x LESS ' -R ' 
  alias more="less" 

  # enable fish with vi keybindings - Escape to enter command mode
  fish_hybrid_key_bindings

  # Enable powerline with daemon
  set -x fish_function_path $fish_function_path "/usr/share/powerline/fish"
  powerline-daemon -q
  powerline-setup
EOF

echo "creating tmux.conf"
# install default .tmux.conf
touch ~/.tmux.conf
cat <<'EOF' >> ~/.tmux.conf
  # Default prefix key for keybindings is C-b
  # Change it to C-a by uncommenting following
  # set -g prefix C-a
  ## bind 'C-a C-a' to send 'C-a' down to the client
  #bind C-a send-prefix
  #unbind C-b

  # set default shell
  set-option -g default-shell /usr/bin/fish

  # vi mode
  set -g mode-keys vi

  # mouse
  set -g mouse on

  # use vim-like keys for splits and windows
  # prefix (C-a) v
  bind-key v split-window -h
  # prefix (C-a) s
  bind-key s split-window -v
  # vim-like keybindings for moving 
  unbind C-M-h
  unbind C-M-j
  unbind C-M-k
  unbind C-M-l
  bind -n C-M-h  select-pane -L
  bind -n C-M-j  select-pane -D
  bind -n C-M-k  select-pane -U
  bind -n C-M-l  select-pane -R
  # vim-like shortcuts for splitting window
  unbind C-M-s
  unbind C-M-v
  bind -n C-M-s  split-window -v
  bind -n C-M-v  split-window -h

  # if pan is not runing vim ctr+hjkl will switch to pane left, down, up, right
  is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
      | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

  bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
  bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
  bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
  bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
  bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

  # copy to xclipboard
  bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xsel -i --clipboard"
EOF