{ inputs, outputs, lib, config, pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
  };

  home.packages = with pkgs; [ 
    sl
    tidal-hifi

    # Languages
    dotnet-sdk_8
  ];

  programs.java.enable = true;
  programs.neovim.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
