
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
    gnumake
    inputs.agenix.packages.${system}.default
    xclip
    cacert
  ];
}