{ pkgs, ... }: {
  imports = [
    ./plasma.nix
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
    sl
    cachix
    devenv
    megasync
  ] ++ (lib.optionals (stdenv.isLinux)) [
    vscode
    jetbrains.idea-ultimate
    jetbrains.rider
    jetbrains.goland
    jetbrains.datagrip
    mongodb-compass
    insomnia
    postman
    obsidian
    obs-studio
    krita

    discord
    vesktop
    teams-for-linux

    tidal-hifi
  ];

  programs = {
    git.enable = true;
    neovim.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fish.interactiveShellInit = builtins.readFile ./programs/config.fish;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
