let
  port = 7746;
in {
  services.paperless = {
    enable = true;
    port = port;
    database.createLocally = true;
    # Add other necessary configurations here based on user requirements or defaults
    # For a basic setup, enable and port might be sufficient.
    # Other options can be added later if needed.
    # mediaDir = "/var/lib/paperless/media";
    # dataDir = "/var/lib/paperless/data";
    # user = "paperless";
  };

  # add paperless to traefik routes
  services.traefik.dynamicConfigOptions.http = {
    services.paperless.loadBalancer.servers = [
      {
        url = "http://localhost:${toString port}";
      }
    ];
    routers.paperless = {
      rule = "Host(`papers.home.rayantonius.com`)";
      tls = {
        certResolver = "cloudflare";
      };
      service = "paperless";
      entrypoints = "websecure";
    };
  };
}
