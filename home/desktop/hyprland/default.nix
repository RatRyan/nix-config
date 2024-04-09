{
  imports = [
    ./waybar
  ];
  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };
}
