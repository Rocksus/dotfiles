{
  pkgs,
  config,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    tailscale
  ];
}
