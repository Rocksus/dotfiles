let
  port = 5007;
in {
  services = {
    audiobookshelf = {
      enable = true;
      # openFirewall = false;
      # user = "audiobookshelf";
      host = "books.home.rayantonius.com";
    };
  };

  # enable to add audiobookshelf to traefik
  services.traefik.dynamicConfigOptions.http = {
    services.n8n.loadBalancer.servers = [
      {
        url = "http://localhost:${toString port}";
      }
    ];
    routers.n8n = {
      rule = "Host(`books.home.rayantonius.com`)";
      tls = {
        certResolver = "cloudflare";
      };
      service = "audiobookshelf";
      entrypoints = "websecure";
    };
  };
}