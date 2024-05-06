{ pkgs, ... }: {
  services.xserver = {
    displayManager.gdm.wayland.enable = true;
    desktopManager.gnome.enable = true;
    desktopManager.plasma6.enable = true;
  };
  xdg.portal.enable = true;

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

