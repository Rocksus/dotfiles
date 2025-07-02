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
    services.mako = {
      enable = true;
      settings = {
        font             = "FiraCode Nerd Font 12";
        width            = 300;
        format           = "%a %s";
        default-timeout  = 4000;

        background-color = "#2E3440CC";
        frame-color      = "#4C566AAC";
        border-color     = "#81A1C1";
        border-size      = 2;

        margin           = 10;
        padding          = 12;
        spacing          = 8;

        shadow           = true;
        shadow-color     = "#00000066";
        shadow-offset-x  = 2;
        shadow-offset-y  = 2;
      };
    };
  };
}