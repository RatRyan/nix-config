{ pkgs, ... }: {
  imports = [
    ./gtk.nix
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
    hyprpaper
    gnome.nautilus
  ];

}
