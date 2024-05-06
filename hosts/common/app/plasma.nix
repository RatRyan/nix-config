{ pkgs, ... }: {
  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  xdg.portal.enable = true;

  services.xserver = {
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    grim
    slurp
    mako
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}

