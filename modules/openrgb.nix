{ pkgs, ... }:

{
  # services.hardware.openrgb.enable = true;
  
  environment.systemPackages = with pkgs; [
    i2c-tools # I2C access stuff
    # openrgb # OpenRGB App
    openrgb-with-all-plugins # OpenRGB App
  ];

  boot = {
    kernelParams = [ "acpi_enforce_resources=lax" ];
    kernelModules = [ "i2c-dev" "i2c-i801" ];
  };

  hardware.i2c.enable = true;

  services.udev.packages = with pkgs; [ 
    i2c-tools
    openrgb
  ];
}
