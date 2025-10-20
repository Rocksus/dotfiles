{
    age = {
        secrets = {
            tailscale-key = {
                file = ../../secrets/tailscale-key.age;
            };
            wg-ID = {
                file = ../../secrets/wg-ID.age;
                path = "/etc/wireguard/ID.conf";
            };
            wg-SG = {
                file = ../../secrets/wg-SG.age;
                path = "/etc/wireguard/SG.conf";
            };
            m920q-traefik-env = {
                file = "../../secrets/m9w0q-traefik-env";
            };
        };
    };
}