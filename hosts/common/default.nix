{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./docker.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./opengl.nix
    ./plasma.nix
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    inputs.fh.packages.x86_64-linux.default

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
    msbuild

    # Misc
    firefox
    wezterm
    xclip
    wl-clipboard
    home-manager
  ];

  xdg.portal.enable = true;

  services.envfs.enable = true;

  users.users = {
    ryan = {
      isNormalUser = true;
      description = "Ryan Ratajczak";
      extraGroups = ["wheel" "networkmanager" "docker"];
    };
  };

  programs = {
    hyprland.enable = true;
    steam.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      ryan = import ../../home;
    };
  };
}
