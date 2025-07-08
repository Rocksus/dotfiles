{config, ...}: {
  networking.wg-quick.interfaces = {
    ID = {
      configFile = config.age.secrets.wg-ID.path;
      autostart = false;
    };
    SG = {
      configFile = config.age.secrets.wg-SG.path;
      autostart = false;
    };
    VH = {
      configFile = config.age.secrets.wg-VH.path;
      autostart = false;
    };
  };
  services.resolved.enable = true;
}
