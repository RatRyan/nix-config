{ lib, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common
  ];

  networking.hostName = "rhalgr";

  services.xserver.xkb.variant = lib.mkForce "colemak_dh";
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(nav, backspace)";
          };
          nav = {
            q = "escape";
            j = "left";
            k = "down";
            i = "up";
            l = "right";
            h = "pagedown";
            y = "pageup";
            u = "home";
            o = "end";
            p = "delete";
            ";" = "backspace";
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
