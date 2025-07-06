{ config, lib, pkgs, ... }:
with lib; let
    cfg = config.utils.podman;
in {
    options.utils.podman.enable = mkEnableOption "enable podman";

    config = mkIf cfg.enable {
        virtualisation = {
            podman = {
                enable = true;
                dockerCompat = true;
                defaultNetwork.settings.dns_enabled = true;
                autoPrune = {
                    enable = true;
                    dates = "weekly";
                    flags = [
                        "--filter=until=24h"
                        "--filter=label!=important"
                    ];
                };
            }
        }
        environment.systemPackages = with pkgs; [
            podman-compose
        ];
    };
}