{ pkgs, ... }:{
  imports = [
    ./nm-applet.nix
    ./waybar.nix
  ];

  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };
}
