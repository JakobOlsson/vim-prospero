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
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-up "['<Super>Page_Up', '<Control><Alt>Up', '<Super>k']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-down "['<Super>Page_Down', '<Control><Alt>Down', '<Super>j']"