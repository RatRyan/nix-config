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

  services.xserver.xkb.layout = "us";
  services.printing.enable = true;
  services.envfs.enable = true;
  services.flatpak.enable = true;

  environment.sessionVariables = {
    FLAKE = "/home/ryan/.nixos-config";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    # CLI tools
    vim
    nodejs
    wget
    nixpkgs-fmt
    nixd
    gnumake
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
    nh

    # Misc
    firefox
    wezterm
    xclip
    wl-clipboard
    home-manager
  ];

  users.users = {
    ryan = {
      isNormalUser = true;
      description = "Ryan Ratajczak";
      extraGroups = [ "wheel" "networkmanager" "docker" ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      ryan = import ../../home;
    };
  };
}
