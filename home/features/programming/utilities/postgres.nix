{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.postgresql;
in {
    options.features.programming.utilities.postgresql.enable =
    mkEnableOption "enable postgresql";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            postgresql
        ];
    };
}