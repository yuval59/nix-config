{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop # Discord
    signal-desktop # Signal
    whatsapp-for-linux # Whatsapp
    ferdium # Misc.
  ];
}
