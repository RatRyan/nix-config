{ pkgs, ... }: {
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.packages = with pkgs; [
    # Code Editors
    vscode

    # CLI Tools
    zoxide
    distrobox
    sl
    lazygit
    lazydocker
    ani-cli
    gh

    # Communication
    discord
    webcord
    teams-for-linux

    # Gaming
    protonup
    prismlauncher

    # Desktop Apps
    tidal-hifi
  ];

  programs = {
    neovim.enable = true;
    starship.enable = true;
    wezterm.enable = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
