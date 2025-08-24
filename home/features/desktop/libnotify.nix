{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.libnotify;
in {
  options.features.desktop.libnotify.enable =
    mkEnableOption "install libnotify for custom notifications (notify-send)";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libnotify
    ];
  };
}