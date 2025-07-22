{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.dbeaver;
in {
    options.features.programming.utilities.dbeaver.enable =
    mkEnableOption "enable dbeaver db client";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            dbeaver-bin
        ];
    };
}