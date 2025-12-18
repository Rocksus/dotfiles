
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./nh.nix
    ./podman.nix
    ./openssh.nix
    ./tailscale.nix
    ./1password
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    gnumake
    inputs.agenix.packages.${pkgs.system}.default
    xclip
    cacert
    libjpeg
  ];
}