{ inputs, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./app
    ./device
    ./system
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  networking.networkmanager.enable = true;

  services = {
    xserver.xkb.layout = "us";
    printing.enable = true;
    envfs.enable = true;
  };

  environment.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    FLAKE = "/home/ryan/.nixos-config";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    vim
    firefox
    wget
    git
    btop
    neofetch

    nh # only used for the search functionallity
    nixd
    nixpkgs-fmt
    gnumake
    unzip
    gh
    zoxide
    fzf
    eza
    stow
    starship
    lazygit
    lazydocker
    xclip
    wl-clipboard
    home-manager

    # I hate you microsoft
    dotnet-sdk_8
    omnisharp-roslyn
    mono
    msbuild
  ];

  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.steam.enable = true;

  users.users = {
    ryan = {
      isNormalUser = true;
      description = "Ryan Ratajczak";
      extraGroups = [ "wheel" "networkmanager" "docker" "video" ];
      shell = pkgs.fish;
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      ryan = import ../../home/ryan/home-manager.nix;
    };
  };
}
