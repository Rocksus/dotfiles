let
  port = 5006; 
in {
  services = {
    actual = {
      enable = true;
      # uncomment if you want to connect directly
      # openFirewall = true;
      settings = {
        port = port;
      };
    };
  };

  # enable to add actual budget to traefik
  services.traefik.dynamicConfigOptions.http = {
    services.n8n.loadBalancer.servers = [
      {
        url = "https://localhost:${toString port}";
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
}