{ 
  lib, 
  config, 
  ... 
}:
let
  port = 7745;
in {
  services.homebox = {
    enable = true;
    settings = {
      HBOX_WEB_PORT = toString port;
      HBOX_OPTIONS_ALLOW_REGISTRATION = "true";
    };
  };

  # add homebox to traefik routes
  services.traefik.dynamicConfigOptions.http = {
    services.homebox.loadBalancer.servers = [
      {
        url = "https://localhost:${port}";
      }
    ];
    routers.homebox = {
      rule = "Host(`homebox.home.rayantonius.com`)";
      tls = {
        certResolver = "cloudflare";
      };
      service = "homebox";
      entrypoints = "websecure";
    };
  };
  systemd.services.homebox = {
    environment = {
      # see https://homebox.software/en/configure/ for options
    };
  };
  # networking.firewall = {
  #   allowedTCPPorts = [ port ];
  # };
}
# uncomment if you want to connect directly