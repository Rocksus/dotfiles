let
    # users
    rocksus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3trl6beNSMRMKXl9Rs5mf3x6JyYIsT1Kie/IqmaRRX";

    # systems
    t480 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3trl6beNSMRMKXl9Rs5mf3x6JyYIsT1Kie/IqmaRRX";
    lv001 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3trl6beNSMRMKXl9Rs5mf3x6JyYIsT1Kie/IqmaRRX";
    m920q = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE27hUthv5P15KwUonnODc5OD1+LJVlNRnGXBRCQumnu";

    users = [
        rocksus
    ];

    systems = [
        t480
        lv001
        m920q
    ];

in {
    "wg-ID.age".publicKeys = systems ++ users;
    "wg-SG.age".publicKeys = systems ++ users;
    "wg-VH.age".publicKeys = systems ++ users;
    "tailscale-key.age".publicKeys = systems ++ users;
}