{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    nh = {
      enable = true;
      flake = "/home/rocksus/dotfiles";
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
