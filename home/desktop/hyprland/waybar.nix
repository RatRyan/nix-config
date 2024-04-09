{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 5;
        height = 24;
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          # "cpu"
          # "memory"
          # "temperature"
          "backlight"
          "keyboard-state"
          "hyprland/language"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          # format= "{name}= {icon}";
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "default" = " ";
          };
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
          };
        };

        "custom/launcher" = {
          "format" = "";
          "tooltip" = false;
        };

        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = " ";
            unlocked = " ";
          };
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        tray = {
          # "icon-size"= 21;
          spacing = 10;
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%b %d %Y}";
        };
        temperature = {
          # "thermal-zone"= 2;
          # "hwmon-path"= "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format = "{temperatureC}°C";
        };
        backlight = {
          "device" = "intel_backlight";
          "rotate" = 0;
          "format" = "{icon}";
          "format-icons" = [" " " " " " " " " " " " " " " " " "];
          "on-scroll-up" = "brightnessctl --device intel_backlight set 5%+";
          "on-scroll-down" = "brightnessctl --device intel_backlight --min-value=1000 set 5%-";
        };
        battery = {
          states = {
            # "good"= 95;
            warning = 30;
            critical = 15;
          };
          format = "{time} {icon}";
          format-charging = "{capacity}%";
          format-plugged = "{capacity}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        network = {
          # "interface"= "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = " ";
          "format-ethernet" = "󰈀 ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-disconnected = "⚠ ";
          # format-alt = "{ipaddr}";
        };
        pulseaudio = {
          format = "{icon}";
          format-muted = "󰖁 ";
          format-icons = {
            default = [" " " " "󰕾 "];
          };
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          on-click-right = "exec pavucontrol";
          tooltip-format = "{volume}%";
        };

        "hyprland/window" = {
          max-length = 54;
        };
        "hyprland/language" = {
          format = "{short}";
        };
      };
    };
    style = ''
      * {
        border: none;
        font-family: Noto Sans Mono;
        font-size: 16px;
      }
    '';
  };
}
