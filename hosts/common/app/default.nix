{ pkgs, ... }: {
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services = {
    xserver.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };
  xdg.portal.enable = true;

  stylix.image = ~/Pictures/wallpapers/ashen.jpg
}
