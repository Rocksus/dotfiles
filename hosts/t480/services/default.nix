{
  imports = [
    ./wireguard.nix
    ./mixxx.nix
    ./desktop
  ];
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
