{
  dconf.settings = {
    # General settings
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      text-scaling-factor = 1.50;
    };
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      repeat-interval = 10;
      delay = 250;
    };

    # Keybinds
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];

      # Unbind
      
    };
  };
}
