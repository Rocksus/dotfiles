
{
  pkgs,
  config,
  username,
  ...
}: {
  imports = [
    ./nh.nix
    ./podman.nix
    ./openssh.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    gnumake
    xclip
  ];
}