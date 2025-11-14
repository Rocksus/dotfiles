{
    config,
    lib,
    pkgs,
    ...
}:
with lib; let
    cfg = config.features.programming.utilities.flyctl;
in {
    options.features.programming.utilities.flyctl.enable = mkEnableOption "enable flyctl";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
          flyctl
        ];
    };
}