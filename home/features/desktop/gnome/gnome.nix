{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.gnome;
in {
  options.features.desktop.gnome.enable = mkEnableOption "gnome config";

  config = mkIf cfg.enable {
    services.desktopManager.gnome = {
      enable = true;
    };
  };
}
