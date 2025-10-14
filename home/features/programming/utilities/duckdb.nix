{
    config,
    lib,
    pkgs,
    ...
}:
with lib; let
    cfg = config.features.programming.utilities.cli.duckdb;
in {
    options.features.programming.utilities.duckdb.enable = mkEnableOption "enable duckdb";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
          duckdb
        ];
    };
}