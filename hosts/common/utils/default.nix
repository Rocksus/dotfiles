
{
  pkgs,
  config,
  username,
  ...
}: {
  imports = [
    ./nh.nix
    ./tailscale.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    gnumake
  ];
}