#!/usr/bin/env bash

thm_love="#eb6f92"
thm_gold="#f6c177"
thm_rose="#ebbcba"
thm_pine="#31748f"
thm_foam="#9ccfd8"
thm_muted="#6e6a86"

tmux set -g status-position bottom
tmux set -g status-justify left
tmux set -g status-left "#[fg=$thm_love,bold]#{?client_prefix,⸙,}#[fg=$thm_rose,bold]#{?client_prefix,,⸙} #S "
tmux set -g status-right " #[fg=white,nobold]#(gitmux -cfg $HOME/.config/tmux/gitmux.yaml)  "
tmux set -g status-left-length 200    # increase length (from 10)
tmux set -g status-style 'bg=default' # transparent

tmux set -g window-status-current-format "#[fg=$thm_foam]• #W"
tmux set -g window-status-format "#[fg=$thm_muted]◦ #W"
