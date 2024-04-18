{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./app
    ./device
    ./system
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;
  services.envfs.enable = true;
  services.flatpak.enable = true;

  environment.sessionVariables = {
    FLAKE = "/home/ryan/.nixos-config";
  };

  environment.systemPackages = with pkgs; [
    # CLI tools
    vim
    wget
    unzip
    git
    gh
    fish
    btop
    zoxide
    fzf
    eza
    stow
    starship
    neofetch
    lazygit
    lazydocker
    docker-compose
    nh

    # Misc
    firefox
    wezterm
    xclip
    wl-clipboard
    home-manager

    # Screw you microsoft
    dotnet-sdk_8
    omnisharp-roslyn
    mono
    msbuild
  ];

  programs = {
    steam.enable = true;
  };

  users.users = {
    ryan = {
      isNormalUser = true;
      description = "Ryan Ratajczak";
      extraGroups = ["wheel" "networkmanager" "docker"];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      ryan = import ../../home;
    };
  };
}
