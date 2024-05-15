{ pkgs, ... }: {
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;

  services = {
    xserver.enable = true;
    xserver.displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
    gnome.gnome-keyring.enable = true;
  };
  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    grim
    slurp
    mako
  ];

  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
