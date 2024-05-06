{ pkgs, ... }: {
  services.xserver = {
    displayManager.gdm.wayland.enable = true;
    desktopManager.gnome.enable = true;
  };
  xdg.portal.enable = true;
}

