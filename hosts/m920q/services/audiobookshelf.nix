let
  port = 5007;
in {
  services = {
    audiobookshelf = {
      enable = true;
      # openFirewall = false;
      # user = "audiobookshelf";
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