{
  config,
  lib,
  pkgs,
  input,
  ...
}:
with lib; let
  cfg = config.features.desktop.swww;
in {
  options.features.desktop.swww.enable = mkEnableOption "swww config";

  config = mkIf cfg.enable {
    services.swww = {
      enable = true;
      package = inputs.swww.packages.${pkgs.system}.swww
    };
  };
}
