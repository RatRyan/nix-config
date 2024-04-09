{ pkgs, ... }: {
  imports = [
    ./waybar.nix
  ];

  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
    ".config/ags" = {
      source = ./ags;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    networkmanagerapplet
    blueman
    gnome.nautilus
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
