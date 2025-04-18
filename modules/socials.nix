{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop # Discord
    signal-desktop # Signal
    nchat # WhatsApp + Telegram in the terminal
    whatsie # WhatsApp

    # whatsapp-for-linux # Whatsapp, haven't tried it yet
    # discord # Discord but bad
    # zapzap # Whatsapp (kinda sucks)
    # ferdium # Misc.
  ];
}
