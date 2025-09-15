{
  imports = [
    ./containers
    ./n8n.nix
    ./homebox.nix
  ];
  services = {
    gnome.gnome-keyring.enable = true;
  };
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}