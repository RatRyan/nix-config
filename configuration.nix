{ pkgs, ... }: {
  imports = [
    ./audio.nix
    ./locale.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ryan = {
    isNormalUser = true;
    description = "Ryan Ratajczak";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    btop
    neofetch
    gnome.gnome-tweaks
    discord
    webcord
    vscode
    nixd
  ];

  # List services that you want to enable:
  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "overload(nav, backspace)";
      };
      nav = {
        q = "escape";
        j = "left";
        k = "down";
        i = "up";
        l = "right";
        u = "home";
        o = "end";
        p = "delete";
        ";" = "backspace";
      };
    };
  };

}
