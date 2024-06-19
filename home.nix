{ pkgs, ... }: {
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.packages = with pkgs; [
    vscode
    discord
    webcord
    prismlauncher
    ani-cli
    tidal-hifi
    lazygit
    lazydocker
    protonup
  ];

  programs = {
    wezterm.enable = true;
    starship.enable = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
