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
      ];
    };
    systemd.services.NetworkManager-wait-online.enable = false;
    systemd.services.tailscaled.after = ["systemd-networkd-wait-online.service"];
  };
}
