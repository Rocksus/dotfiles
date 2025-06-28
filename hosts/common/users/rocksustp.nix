{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.rocksustp = {
    initialHashedPassword = "$y$j9T$sUIXwdwForLlUjYY0Qore.$6fi7PZMe1LMppuoOU033aYwvK2/SWLWNuwPlC.W0ABC";
    isNormalUser = true;
    description = "rocksustp";
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
      
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.rocksustp =
    import ../../../home/rocksustp/${config.networking.hostName}.nix;
}
