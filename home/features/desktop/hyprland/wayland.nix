{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.wayland;
in {
  options.features.desktop.wayland.enable = mkEnableOption "wayland extra tools and config";

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      style = ''
        * {
          font-family: "Fira Code";
        }

        #waybar {
          background: #171717;
          color: #fff;
        }

        #clock {
          color: #fff;
        }

        #tray {
          padding-left: 4px;
        }

        #workspaces button:hover {
          background-color: transparent;
        }

        #workspaces button {
          color: #737373;
          padding-left: 4px;
          padding-right: 4px;
          border-radius: 0px;
        }

        #workspaces button:hover {
          background-color: #262626;
        }

        #workspaces button.active {
          color: #84cc16;
        }

        #window {
          color: #fff;
        }

        #network {
          color: #3b82f6;
          margin-right: 8px;
        }

        #pulseaudio {
          color: #14b8a6;
          margin-right: 4px;
        }

        #cpu {
          color: #0ea5e9;
          margin-right: 4px;
        }

        #temperature {
          color: #eab308;
          margin-right: 4px;
        }

        #memory {
          color: #d946ef;
          margin-right: 4px;
        }

        #custom-powermenu {
          color: #f43f5e;
        }
      '';
      settings = {
        mainbar = {
          layer = "top";
          position = "top";
          "margin-bottom" = 0;
          "modules-left" = [
            "clock"
            "custom/separator"
            "hyprland/workspaces"
            "custom/separator"
            "tray"
          ];
          "modules-center" = [
            "hyprland/window"
          ];
          "modules-right" = [
            "temperature"
            "memory"
            "cpu"
            "pulseaudio"
            "battery"
            "network"
            "custom/separator"
            "custom/powermenu"
          ];

          "custom/separator" = {
            exec = "echo \"|\"";
            format = "{}";
          };
          "hyprland/window" = {
            format = "{}";
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            "separate-outputs" = false;
            "active-only" = false;
            "all-outputs" = false;
            "format-icons" = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "10" = "10";
              "11" = "1";
              "12" = "2";
              "13" = "3";
              "14" = "4";
              "15" = "5";
              "16" = "6";
              "17" = "7";
              "18" = "8";
              "19" = "9";
              "110" = "10";
            };
          };
          tray = {
            "icon-size" = 16;
            spacing = 8;
          };
          clock = {
            format = " 󰸗 {:%I:%M %p} ";
            interval = 60;
            tooltip = true;
            "tooltip-format" = "{:%d %B %H:%M}";
          };
          network = {
            format = "{essid} ({signalStrength}%) ";
            "format-wifi" = "{essid} ({signalStrength}%) ";
            "format-ethernet" = "󰈀 {ipaddr}/{interface}";
            "format-disconnected" = "";
            "tooltip-format-wifi" = "{essid} ({signalStrength}%) {ipaddr}";
            "tooltip-format-disconnected"= "Disconnected";
            interval = 5;
            "on-click" = "nmcli device wifi rescan && wpa_cli -i wlan0 reconfigure";
          };
          temperature = {
            format = "{icon} {temperatureC}°C ";
            "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
            "critical-threshold" = 80;
            "format-icons" = [
              ""
              ""
              ""
            ];
          };
          memory = {
            format = "󰫗 {}% ";
            tooltip = "false";
          };
          cpu = {
            format = " {usage}% ";
            tooltip = "false";
          };
          pulseaudio = {
            format = " {volume}%";
            "scroll-step" = 1;
            "on-click" = "pavucontrol";
          };
          battery = {
            format = "{capacity}% {icon}";
            "format-icons" = [
              " "
              " "
              " "
              " "
              " "
            ];
          };
          "custom/powermenu" = {
            format = "  ";
            tooltip = false;
            "on-click" = "exec wlogout -p layer-shell";
          };
        };
      };
    };

    home.packages = with pkgs; [
      grim
      qt6.qtwayland
      slurp
      waypipe
      wf-recorder
      wl-mirror
      wl-clipboard
      wlogout
      wtype
      ydotool
      brightnessctl
    ];
  };
}

# https://github.com/maxhu08/dotfiles-old/blob/hyprland-dots/waybar/config