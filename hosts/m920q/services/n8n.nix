{
  services = {
    n8n = {
      enable = true;
      openFirewall = true;
    };
    actual = {
      enable = true;
      openFirewall = true;
      settings = {
        hostname = "m920q";
      };
    };
  };
  systemd.services.n8n = {
    environment = {
      N8N_SECURE_COOKIE = "false";
    };
  };
}