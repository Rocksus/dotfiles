{
  imports = [
    ./wireguard.nix
    ./mixxx.nix
    ./teleport.nix
    ./desktop
  ];
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
