{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"

          set -g @catppuccin_status_left_separator ""
          set -g @catppuccin_status_middle_separator ""
          set -g @catppuccin_status_right_separator ""

          set -g @catppuccin_window_status_style "none"
        '';
      }
      tmuxPlugins.cpu
      tmuxPlugins.battery
    ];

    keyMode = "vi";
    terminal = "screen-256color";

    extraConfig = ''
      unbind -a -T root

      set -s escape-time 0
      set -g pane-border-lines double
      set -g base-index 1
      setw -g pane-base-index 1

      set -g mouse on
      set -ga terminal-overrides ',*256color*:smcup@:rmcup@'

      set -g history-limit 2000

      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "config reloaded"

      bind -n M-d detach-client

      bind -n M-Enter new-window
      bind -n M-v split-window -h
      bind -n M-g split-window -v

      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9
      bind -n M-0 select-window -t 10
    '';
  };
}
