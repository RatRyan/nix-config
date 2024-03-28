{ inputs, pkgs, ... }: {
  imports = [
    ./hyprland
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    permittedInsecurePackages = [
      # megasync
      "freeimage-unstable-2021-11-01"
    ];
  };

  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
  };

  home.packages = with pkgs; [ 
    # CLI Tools
    sl

    # Tools 
    vscode
    jetbrains.idea-ultimate
    jetbrains.rider
    jetbrains.clion
    mongodb-compass
    postman

    # Languages
    dotnet-sdk_8
    go

    # Misc
    tidal-hifi
    obsidian
    megasync
    discord-screenaudio
    discord
    teams-for-linux
  ];

  programs = {
    java.enable = true;
    neovim.enable = true;
    git.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
