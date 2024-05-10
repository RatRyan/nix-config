{
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;

  services = {
    xserver.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };
  xdg.portal.enable = true;
}
