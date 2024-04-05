{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    settings = {
      "$mainmod" = "SUPER";
      bind = [
        "$mainmod, Return, exec, wezterm"
        "$mainmod SHIFT, Q, killactive"
      ];
    };
  };
}
