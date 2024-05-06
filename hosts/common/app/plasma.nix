{ pkgs, ... }: {
  services.xserver = {
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };
  xdg.portal.enable = true;
}

