{
  imports = [
    ./wireguard.nix
    ./mixxx.nix
    ./teleport.nix
    ./desktop
  ];
  services = {
    gnome.gnome-keyring.enable = true;

    logind = {
      lidSwitch = "ignore";
      lidSwitchDocked = "ignore";
      lidSwitchExternalPower = "ignore";
    };
  };
}
