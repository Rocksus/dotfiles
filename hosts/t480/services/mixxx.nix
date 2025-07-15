{config, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mixxx
  ];
  # allow mixxx to access udev
  services.udev.packages = with pkgs; [ 
    mixxx 
  ];
}
