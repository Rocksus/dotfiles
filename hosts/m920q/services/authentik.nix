{
  config,
  ...
}:
let
  port = 9000;
in {
  services = {
    authentik = {
      enable = true;
      # The environmentFile needs to be on the target host!
      # Best use something like sops-nix or agenix to manage it
      environmentFile = "${config.age.secrets.m920q-authentik-env.path}";
      settings = {
        disable_startup_analytics = true;
        avatars = "initials";
      };
    };
  };

  services.traefik.dynamicConfigOptions.http = {
    services.authentik.loadBalancer.servers = [
      {
        url = "http://localhost:${toString port}";
      }
    ];
    routers.authentik = {
      rule = "Host(`auth.home.rayantonius.com`)";
      tls = {
        certResolver = "cloudflare";
      };
      service = "authentik";
      entrypoints = "websecure";
    };
  };
}