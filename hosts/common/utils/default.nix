
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
    ./tailscale.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    gnumake
    xclip
  ];
}