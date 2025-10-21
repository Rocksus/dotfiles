{config, ...}:{
  services.traefik = {
    enable = true;
    staticConfigOptions = {
      log = {
        level = "WARN";
      };
      api = {
        dashboard = true;
      };
      entryPoints = {
        web = {
          address = ":80";
          # todo: check middleware for crowdsec, authentik
          http.redirections.entryPoint = {
            to = "websecure";
            scheme = "https";
          };
        };
        websecure = {
          address = ":443";
        };
      };
      certificatesResolvers = {
        tailscale = {
          tailscale = {};
        };
        cloudflare = {
          acme = {
            email = "rayantonius+cf@gmail.com";
            storage = "/var/lib/traefik/acme.json";
            caserver = "https://acme-v02.api.letsencrypt.org/directory";
            dnsChallenge = {
              provider = "cloudflare";
              resolvers = [
                "1.1.1.1:53"
                "1.0.0.1:53"
              ];
              propagation.delayBeforeChecks = 30;
            };
          };
        };
      };
    };
    dynamicConfigOptions = {
      http = {
        routers = {
          api = {
            rule = "Host(`tr.home.rayantonius.com`)";
            service = "api@internal";
            entrypoints = ["websecure"];
            tls = {
              certResolver = "tailscale";
            };
          };
        };
      };
    };
  };
  systemd.services.traefik.serviceConfig = {
    EnvironmentFile = ["${config.age.secrets.m920q-traefik-env.path}"];
  };
  networking.firewall.allowedTCPPorts = [80 443];
}