{
  imports = [
    ./containers
    ./traefik.nix
    ./n8n.nix
    ./actualbudget.nix
    ./homebox.nix
    ./authentik.nix
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