{
  dconf.settings = {
    # General settings
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      text-scaling-factor = 1.50;
    };
    "org/gnome/mutter/" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };

    # Keybinds
    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
    };
  };
}
