{
  imports = [
    ./containers
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