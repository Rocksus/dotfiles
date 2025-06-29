{ config, ... }:
{
  hardware.bluetooth.enable = true;
  services.bluez.enable = true;
  services.bluez.obex.enable = true;
}