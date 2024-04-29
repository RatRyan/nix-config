{ inputs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common
  ];

  networking.hostName = "rhalgr";

  services.xserver.xkb = {
    layout = lib.mkForce "us";
    variant = lib.mkForce "colemak_dh_wide";
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(nav, backspace)";
          };
          nav = {
            q = "escape";
            k = "left";
            l = "down";
            o = "up";
            ";" = "right";
            j = "pagedown";
            u = "pageup";
            i = "home";
            p = "end";
            "[" = "delete";
            "'" = "backspace";
          };
        };
      };
    };
  };

  # Enable touchpad
  services.libinput.enable = true;

  powerManagement.powertop.enable = true;

  system.stateVersion = "23.11";
}
