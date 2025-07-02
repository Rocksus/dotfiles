{
  disko.devices = {
    disk = {
      primary = {
        type     = "disk";
        device   = "/dev/nvme0n1";
        content  = {
          type       = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
            };

            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type        = "filesystem";
                format      = "vfat";
                mountpoint  = "/boot";
                mountOptions = [ "fmask=0077" "dmask=0077" ];
              };
            };

            root = {
              size = "100%";
              content = {
                type       = "filesystem";
                format     = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
