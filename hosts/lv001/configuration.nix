{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./disko-config.nix
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  services = {
    xserver = {
      desktopManager.gnome = {
        enable = true;
      };
      displayManager.gdm = {
        enable = true;
        autoSuspend = false;
      };
    };
  };

  networking.hostName = "lv001";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.zsh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}

