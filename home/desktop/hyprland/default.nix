{ pkgs, ... }: {
  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
    # How did I never know ags existed
    # this thing is wild
    ".config/ags" = {
      source = ./ags;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    networkmanagerapplet
    gnome.nautilus
  ];
}
