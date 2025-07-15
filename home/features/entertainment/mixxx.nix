{config, lib, pkgs, ...}:
with lib; let
  cfg = config.features.entertainment.mixxx;
in {
  options.features.entertainment.mixxx.enable =
    mkEnableOption "install mixxx for dj mixing";
        
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            mixxx
        ];
        services.udev.packages = with pkgs; [ 
            mixxx 
        ];
    };
}
