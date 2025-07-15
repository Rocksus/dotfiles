{
  imports = [
    ./wireguard.nix
    ./mixxx.nix
  ];
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
