{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.mako;
in {
  options.features.desktop.mako.enable =
    mkEnableOption "install mako for hyprland notification daemon";

  config = mkIf cfg.enable {
    programs.mako = {
      enable = true;
      settings = {
        font = "FiraCode Nerd Font 12";
        width = 300;            # notification width in pixels
        format = "%a %s";     # timestamp and summary
        default_timeout = 4000; # milliseconds before auto-dismiss

        background_color = "#2E3440CC";
        frame_color      = "#4C566AAC";
        border_color     = "#81A1C1";
        border_size      = 2;

        margin  = 10;  # space from screen edges
        padding = 12;  # space inside notification
        spacing = 8;   # space between multiple notifications

        shadow = true;
        shadow_color = "#00000066";
        shadow_offset_x = 2;
        shadow_offset_y = 2;

        # define colors for different urgency levels
        colors = {
          normal = {
            background = "#2E3440";
            border     = "#4C566A";
            text       = "#D8DEE9";
          };
          urgent = {
            background = "#BF616A";
            border     = "#D08770";
            text       = "#ECEFF4";
          };
          timeout = {
            background = "#5E81AC";
            border     = "#88C0D0";
            text       = "#ECEFF4";
          };
        };
      };
    };
  };
}