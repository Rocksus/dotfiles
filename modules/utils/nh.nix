{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    nh = {
      enable = true;
      flake = "/home/rocksustp/codes/dotfiles";
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
