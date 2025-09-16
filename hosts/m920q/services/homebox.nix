{ 
  lib, 
  config, 
  ... 
}:
let
  port = 7745;
in {
  services.homebox = {
    enable = true;
    settings = {
      HBOX_WEB_PORT = port;
    };
  };
  systemd.services.homebox = {
    environment = {
      # see https://homebox.software/en/configure/ for options
    };
  };
  networking.firewall = lib.mkIf config.openFirewall {
    allowedTCPPorts = [ port ];
  };
}