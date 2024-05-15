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
    megasync

    # Languages
    gcc
    nodejs
    go
    openjdk22
    elixir

    # Language tools
    cmake
    gopls
    gtest
    elixir-ls

    vscode
    jetbrains.idea-ultimate
    jetbrains.rider
    jetbrains.goland
    jetbrains.datagrip
    jetbrains.webstorm
    mongodb-compass
    insomnia
    postman
    obs-studio
    obsidian

    discord
    teams-for-linux

    tidal-hifi
  ];

  programs = {
    git = {
      enable = true;
      userEmail = "ryantratajczak@gmail.com";
      userName = "RatRyan";
    };
    neovim.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fish = {
      enable = true;
      interactiveShellInit = builtins.readFile ./config.fish;
    };
    starship = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
  };

  home.file.".wezterm.lua" = {
    source = "./.wezterm.lua";
    target = "~/.wezterm.lua";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
