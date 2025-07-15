{config, pkgs, ...}: {
  programs.mixxx = {
    enable = true;
  };
  # allow mixxx to access udev
  services.udev.packages = [ pkgs.mixxx ];
}
