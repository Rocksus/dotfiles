{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.postgres;
in {
    options.features.programming.utilities.postgres.enable =
    mkEnableOption "enable postgresql";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            postgresql
        ];
    };
}