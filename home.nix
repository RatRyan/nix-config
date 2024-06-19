{ pkgs, ... }: {
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.packages = with pkgs; [
    vscode
    discord
    webcord
    prismlauncher
    ani-cli
    tidal-hifi
    lazygit
    lazydocker
  ];

  programs = {
    wezterm.enable = true;

    starship = {
      enable = true;
      presets = [ "nerd-font-symbols" ];
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
