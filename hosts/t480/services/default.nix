{
  imports = [
    ./tailscale.nix
    ./wireguard.nix
  ];
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
