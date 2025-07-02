{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.rocksus = {
    initialHashedPassword = "$y$j9T$sUIXwdwForLlUjYY0Qore.$6fi7PZMe1LMppuoOU033aYwvK2/SWLWNuwPlC.W0ABC";
    isNormalUser = true;
    description = "rocksus";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG3trl6beNSMRMKXl9Rs5mf3x6JyYIsT1Kie/IqmaRRX"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.rocksus =
    import ../../../home/rocksus/${config.networking.hostName}.nix;
}
