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
    jetbrains.datagrip
    android-studio
    mongodb-compass
    postman
    gparted

    # Communication
    discord
    discord-screenaudio
    teams-for-linux

    # Misc
    tidal-hifi
    obsidian
    megasync
  ];

  programs = {
    git.enable = true;
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
    neovim.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
