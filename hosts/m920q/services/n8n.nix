{
  services = {
    n8n = {
      enable = true;
      # uncomment if you want to connect directly.
      # openFirewall = true;
    };
  };

  # enable to add n8n to traefik
  services.traefik.dynamicConfigOptions.http = {
    services.n8n.loadBalancer.servers = [
      {
        url = "https://localhost:5678";
      }
    ];
    routers.n8n = {
      rule = "Host(`n8n.home.rayantonius.com`)";
      tls = {
        certResolver = "cloudflare";
      };
      service = "n8n";
      entrypoints = "websecure";
    };
  };

  # uncomment if you want to connect directly.
  # systemd.services.n8n = {
  #   environment = {
  #     N8N_SECURE_COOKIE = "false";
  #   };
  # };
}