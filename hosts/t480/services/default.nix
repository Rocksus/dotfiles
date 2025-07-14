{
  imports = [
    ./wireguard.nix
  ];
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
