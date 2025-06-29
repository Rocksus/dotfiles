{ config, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

    nameservers = [
      "208.67.222.222"  # OpenDNS primary
      "208.67.220.220"  # OpenDNS secondary
      "8.8.8.8"         # Google fallback
      "8.8.4.4"         # Google fallback
    ];

    # If you need to override or clear the 'search' line, set:
    search = [ ];
  };
}