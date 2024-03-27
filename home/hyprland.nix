{ pkgs, lib, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = false;
    settings = {
      "$mod" = "SUPER";
      bindm = [
        "$mod, Return, exec, wezterm"
      ];
    };
  };
}
