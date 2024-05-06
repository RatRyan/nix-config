{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix
      set -g base-index 1
      set-option -g renumber-windows on
      set -s escape-time 0
      bind-key -n M-n new-window -c "#{pane_current_path}"
      bind-key -n M-1 select-window -t :1
      bind-key -n M-2 select-window -t :2
      bind-key -n M-3 select-window -t :3
      bind-key -n M-4 select-window -t :4
      bind-key -n M-5 select-window -t :5
      bind-key -n M-6 select-window -t :6
      bind-key -n M-7 select-window -t :7
      bind-key -n M-8 select-window -t :8
      bind-key -n M-9 select-window -t :9
      bind-key -n M-0 select-window -t :0
      bind-key -n M-. select-window -n
      bind-key -n M-, select-window -p
      bind-key -n M-< swap-window -t -1
      bind-key -n M-> swap-window -t +1
      bind-key -n M-X confirm-before "kill-window"
      bind-key -n M-v split-window -h -c "#{pane_current_path}"
      bind-key -n M-b split-window -v -c "#{pane_current_path}"
      bind-key -n M-R command-prompt -I "" "rename-window '%%'"
    '';
  };
}
