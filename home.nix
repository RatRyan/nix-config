{ config, pkgs, ... }: {
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.packages = with pkgs; [
    vscode
    discord
    prismlauncher
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}