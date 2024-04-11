{ pkgs, ... }: {
  imports = [
    ./desktop/plasma
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
    stateVersion = "23.11";
  };

  home.packages = with pkgs; [ 
    # CLI Tools
    sl
    wofi
    libsForQt5.bismuth

    # Tools 
    vscode
    jetbrains.idea-ultimate
    jetbrains.rider
    jetbrains.clion
    jetbrains.datagrip
    mongodb-compass
    postman
    gparted

    # Communication
    discord
    teams-for-linux

    # Misc
    obsidian
    megasync
    tidal-hifi
  ];

  programs = {
    git.enable = true;
    neovim.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableFishIntegration = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
