{ pkgs, ... }:{
  imports = [
    ./waybar.nix
  ];

  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };

  home.packages = with pkgs; [
    networkmanagerapplet
    gnome.nautilus
  ];
}
