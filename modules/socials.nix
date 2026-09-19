{ pkgs, ... }:
      
{
  environment.systemPackages = with pkgs; [
    vesktop # Discord
    signal-desktop # Signal

    # discord # Discord
    # zapzap # Whatsapp (kinda sucks)
    # ferdium # Misc.
  ];
}
