{ pkgs, ... }: {
  home.file.".local/share/icons/Papirus" = {
    source = ./Papirus;
    recursive = true;
  };
}
