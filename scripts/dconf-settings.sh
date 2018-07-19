#!/bin/env bash
# write tilix keybindings
dconf write /com/gexperts/Tilix/keybindings/session-switch-to-terminal-left "'<Primary><Alt>h'"
dconf write /com/gexperts/Tilix/keybindings/session-switch-to-terminal-down "'<Primary><Alt>j'"
dconf write /com/gexperts/Tilix/keybindings/session-switch-to-terminal-right "'<Primary><Alt>l'"
dconf write /com/gexperts/Tilix/keybindings/session-switch-to-terminal-up "'<Primary><Alt>k'"
# write tilix other settings
dconf write /com/gexperts/Tilix/tab-position "'top'"
dconf write /com/gexperts/Tilix/use-overlay-scrollbar false
dconf write /com/gexperts/Tilix/sidebar-on-right false
dconf write /com/gexperts/Tilix/terminal-title-style "'none'"
dconf write /com/gexperts/Tilix/theme-variant "'dark'"

# gnome shell/mutter keybindings
# remove Super+H for minimizing
dconf write /org/gnome/desktop/wm/keybindings/minimize "['']"
# change lockscreen shortcut
dconf write /org/gnome/settings-daemon/plugins/media-keys/screensaver "['<Super>q']"
# if you have "dash to dock" extension instlled -
# remove mapping that is default to Super+q, which we use above
dconf write /org/gnome/shell/extensions/dash-to-dock/shortcut-text "''"
# switch desktop up and down
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-up "['<Super>Page_Up', '<Control><Alt>Up', '<Super>k']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-down "['<Super>Page_Down', '<Control><Alt>Down', '<Super>j']"
