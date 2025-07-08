{ lib, config, pkgs, ... }:

{
  home.username = "rocksus";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch
    kitty
  ];

  # git config
  programs.git = {
    enable = true;
    userName = "Ray Antonius";
    userEmail = "rayantonius@gmail.com";
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        hostname     = "github.com";
        user         = "git";
        identityFile = [ "~/.ssh/id_personal" ];
      };
      "github_verihubs" = {
        hostname     = "github.com";
        user         = "git";
        identityFile = [ "/home/rocksus/.ssh/id_vh" ];
      };
      "m920q" = {
        hostname     = "192.168.1.161";
        user         = "rocksus";
        identityFile = [ "/hom-e/rocksus/.ssh/id_nixos_rocksus" ];
      };
    };
  };
}
