#!/bin/env sh
echo "creating config.fish"
mkdir -p  ~/.config/fish/
cat <<'EOF' >> ~/.config/fish/config.fish
  # use VIM Extended/Enhanced
  alias vim="nvim"
  alias vi="nvim"

  # SET GLOBAL ENV VARIABLES
  set -x SHELL /usr/bin/fish 
  set -x EDITOR /usr/bin/nvim
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
  # set default terminal and enable true colors terminal
  set -g default-terminal "tmux-256color"
  set-option -ga terminal-overrides " ,xterm-256color:Tc" 

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

  ## FOLLOWING IS JUST COLORS - SORT OF A THEME
  ## COLORSCHEME: gruvbox dark
  set-option -g status "on"

  # default statusbar color
  set-option -g status-style bg=colour237,fg=colour223 # bg=bg1, fg=fg1

  # default window title colors
  set-window-option -g window-status-style bg=colour214,fg=colour237 # bg=yellow, fg=bg1

  # default window with an activity alert
  set-window-option -g window-status-activity-style bg=colour237,fg=colour248 # bg=bg1, fg=fg3

  # active window title colors
  set-window-option -g window-status-current-style bg=red,fg=colour237 # fg=bg1

  # pane border
  set-option -g pane-active-border-style fg=colour250 #fg2
  set-option -g pane-border-style fg=colour237 #bg1

  # message infos
  set-option -g message-style bg=colour239,fg=colour223 # bg=bg2, fg=fg1

  # writing commands inactive
  set-option -g message-command-style bg=colour239,fg=colour223 # bg=fg3, fg=bg1

  # pane number display
  set-option -g display-panes-active-colour colour250 #fg2
  set-option -g display-panes-colour colour237 #bg1

  # clock
  set-window-option -g clock-mode-colour colour109 #blue

  # bell
  set-window-option -g window-status-bell-style bg=colour167,fg=colour235 # bg=red, fg=bg

  ## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
  set-option -g status-justify "left"
  set-option -g status-left-style none
  set-option -g status-left-length "80"
  set-option -g status-right-style none
  set-option -g status-right-length "80"
  set-window-option -g window-status-separator ""

  set-option -g status-left "#[fg=colour248, bg=colour241] #S #[fg=colour241, bg=colour237, nobold, noitalics, nounderscore]"
  set-option -g status-right "#[fg=colour239, bg=colour237, nobold, nounderscore, noitalics]#[fg=colour246,bg=colour239] %Y-%m-%d  %H:%M #[fg=colour248, bg=colour239, nobold, noitalics, nounderscore]#[fg=colour237, bg=colour248] #h "

  set-window-option -g window-status-current-format "#[fg=colour237, bg=colour214, nobold, noitalics, nounderscore]#[fg=colour239, bg=colour214] #I #[fg=colour239, bg=colour214, bold] #W #[fg=colour214, bg=colour237, nobold, noitalics, nounderscore]"
  set-window-option -g window-status-format "#[fg=colour237,bg=colour239,noitalics]#[fg=colour223,bg=colour239] #I #[fg=colour223, bg=colour239] #W #[fg=colour239, bg=colour237, noitalics]"
EOF
