{
    config,
    lib,
    ...
}:
with lib; let
    cfg = config.features.cli.helix;
in {
    options.features.cli.helix.enable = mkEnableOption "enable helix";

    config = mkIf cfg.enable {
        programs.helix = {
            enable = true;
            extraPackages = [
                
            ];
        };
    };
}