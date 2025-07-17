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
        };
    };
}