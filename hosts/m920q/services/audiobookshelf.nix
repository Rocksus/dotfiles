let
  port = 5007;
in {
  services = {
    audiobookshelf = {
      enable = true;
      port = port;
      # openFirewall = false;
      # user = "audiobookshelf";
      # host = "127.0.0.1";
    };
  };

  # enable to add audiobookshelf to traefik
  services.traefik.dynamicConfigOptions.http = {
    services.audiobookshelf.loadBalancer.servers = [
      {
        url = "http://localhost:${toString port}";
      }
    ];
    routers.audiobookshelf = {
      rule = "Host(`books.home.rayantonius.com`)";
      tls = {
        certResolver = "cloudflare";
      };
      service = "audiobookshelf";
      entrypoints = "websecure";
    };
  };
}