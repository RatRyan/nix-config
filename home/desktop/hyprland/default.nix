{
  imports = [
    ./waybar.nix
  ];

  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };
}
