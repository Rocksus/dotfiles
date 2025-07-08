{config, ...}: {
  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-key.path;
    useRoutingFeatures = "both";
    extraUpFlags = [
      "--accept-routes"
      "--exit-node-allow-lan-access"
    ];
  };
}
