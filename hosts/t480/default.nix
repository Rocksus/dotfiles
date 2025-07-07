{
    imports = [ ../common ./configuration.nix ];

    utils = {
        podman.enable = true;
    };
}
