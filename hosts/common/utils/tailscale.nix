{config, lib, ...}:
with lib; let
    cfg = config.utils.tailscale;
in { 
  options.utils.tailscale.enable = mkEnableOption "enable tailscale";

  config = mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      authKeyFile = config.age.secrets.tailscale-key.path;
      useRoutingFeatures = "both";
      extraUpFlags = [
        "--accept-routes"
        "--exit-node-allow-lan-access"
      ];
    };
  };
}
