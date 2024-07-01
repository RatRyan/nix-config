{ pkgs, ... }: {
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.packages = with pkgs; [
    # CLI Tools
    direnv
    distrobox
    lazygit
    lazydocker
    fzf
    bat
    zoxide
    ripgrep
    unzip

    # Cloud Tools
    awscli2
    aws-sam-cli

    # Communication
    discord
    webcord
    teams-for-linux
    zoom-us

    # Desktop Apps
    tidal-hifi
    obsidian
  ];

  programs = {
    neovim.enable = true;
    starship.enable = true;
    wezterm.enable = true;
    tmux.enable = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
