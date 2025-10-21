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
    services.budget.loadBalancer.servers = [
      {
        url = "https://localhost:${toString port}";
      }
    ];
    routers.budget = {
      rule = "Host(`budget.home.rayantonius.com`)";
      tls = {
        certResolver = "tailscale";
      };
      service = "budget";
      entrypoints = "websecure";
    };
  };
}