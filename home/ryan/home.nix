{ pkgs, ... }: {
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.packages = with pkgs; [
    # CLI Tools
    bat
    direnv
    distrobox
    eza
    fzf
    lazygit
    lazydocker
    ripgrep
    tmux
    unzip
    zoxide

    # Cloud Tools
    awscli2
    aws-sam-cli

    # Communication
    discord
    teams-for-linux
    webcord
    zoom-us

    # Desktop Apps
    tidal-hifi
    obsidian
    wezterm
  ];

  programs.starship = {
    enable = true;
    settings = (builtins.fromTOML (builtins.readFile ./starship.toml));
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
