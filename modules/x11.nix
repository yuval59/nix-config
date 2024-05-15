{ pkgs, ... }:

{
    services = {
        xserver = {
            # Enable touchpad support (enabled default in most desktopManager).
            # libinput.enable = true;

            # Enable the X11 windowing system.
            enable = true;
  
            # Enable the KDE Plasma Desktop Environment.
            desktopManager.plasma5.enable = true;
  
            # Configure keymap in X11
            xkb = {
                layout = "us";
                variant = "";
            };
        };

        displayManager = {
            sddm.enable = true;

            # Enable automatic login for the user.
            autoLogin.enable = true;
            autoLogin.user = "yuval";
        };
    };
}