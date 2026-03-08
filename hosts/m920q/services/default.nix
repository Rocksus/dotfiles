{
  imports = [
    ./containers
    ./traefik.nix
    ./n8n.nix
    ./actualbudget.nix
    ./homebox.nix
    ./authentik.nix
    ./paperless.nix
    ./audiobookshelf.nix
  ];
  services = {
    gnome.gnome-keyring.enable = true;
  };
  systemd.sleep.settings.Sleep = {
    AllowSuspend = "no";
    AllowHibernation = "no";
    AllowHybridSleep = "no";
    AllowSuspendThenHibernate = "no";
  };
}
