{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    syncthingtray # GUI Application
  ];

  services.syncthing = {
    enable = true;
    user = "yuval";
    configDir = "/home/yuval/.config/syncthing";

    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI

    settings = {
      devices = {
        "NAS" = { id = "BQW3GQD-XOU4MLC-Y7RKZM4-M6ZCUE7-2QHY4QJ-FVHZBA7-43HI3JN-X47YPA4"; };
      };

      folders = {
        "Nix" = {
          path = "/home/yuval/Nix";
          devices = [ "NAS" ];
        };

        "Documents" = {
          path = "/home/yuval/Documents";
          devices = [ "NAS" ];
        };

        "Pictures" = {
          path = "/home/yuval/Pictures";
          devices = [ "NAS" ];
        };

        "Videos" = {
          path = "/home/yuval/Videos";
          devices = [ "NAS" ];
        };
      };
    };
  };
}