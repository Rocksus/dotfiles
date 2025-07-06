
{
  pkgs,
  config,
  username,
  ...
}: {
  imports = [
    ./nh.nix
    ./tailscale.nix
    ./podman.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    gnumake
    xclip
  ];
}