#!/usr/bin/env bash

tmux set -g status-position bottom
tmux set -g status-left " #[fg=red,bold]#{?client_prefix,#S,}#[fg=blue,bold]#{?client_prefix,,#S} "
tmux set -g status-right " #[fg=white,nobold]#(gitmux -cfg $HOME/.config/tmux/gitmux.yaml)  "
tmux set -g status-left-length 200    # increase length (from 10)
tmux set -g status-style 'bg=default' # transparent

tmux set -g window-status-current-format '#[fg=magenta]• #W'
tmux set -g window-status-format '#[fg=gray]• #W'
