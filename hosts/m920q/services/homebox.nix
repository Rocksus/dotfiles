{
  services.homebox = {
    enable = true;
  };
  systemd.services.homebox = {
    environment = {
      # see https://homebox.software/en/configure/ for options
    };
  };
}