{ inputs, pkgs, ... }: {

  imports = [
    ./desktop/hyprland
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
    pipes
    wofi

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
    discord-screenaudio
    teams-for-linux

    # Misc
    obsidian
    megasync
    tidal-hifi
  ];

  programs = {
    git.enable = true;
    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
    neovim.enable = true;
    kitty = {
      enable = true;
      theme = "Catppuccin-Mocha";
      shellIntegration.enableFishIntegration = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
