{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./disko-config.nix
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "m920q";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.zsh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}

