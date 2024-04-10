{ config, pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
