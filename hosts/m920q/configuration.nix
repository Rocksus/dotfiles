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
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
  };
  # issue #100390 https://github.com/NixOS/nixpkgs/issues/100390
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.login1.suspend" ||
            action.id == "org.freedesktop.login1.suspend-multiple-sessions" ||
            action.id == "org.freedesktop.login1.hibernate" ||
            action.id == "org.freedesktop.login1.hibernate-multiple-sessions")
        {
            return polkit.Result.NO;
        }
    });
  '';

  networking.hostName = "m920q";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.zsh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?
}

