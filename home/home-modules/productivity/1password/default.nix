{ config, pkgs, ...}: {
  programs = {
    _1password-gui = {
      enable  = true;
    };
    _1password-cli = {
      enable  = true;
    };
  };
}