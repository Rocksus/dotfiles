{
  networking.resolvconf.enable = true;
  networking.resolvconf.dnsServers = [
    "208.67.222.222"  # OpenDNS primary
    "208.67.220.220"  # OpenDNS secondary
    "8.8.8.8"         # Google DNS backup
    "8.8.4.4"         # Google DNS backup
  ];
  networking.resolvconf.dnsSearch = [ "" ];
}
