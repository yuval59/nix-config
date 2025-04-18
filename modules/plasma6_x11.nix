{ pkgs, ... }:

{
    services = {
        xserver.enable = true;

        desktopManager.plasma6.enable = true;

        displayManager = {
            sddm.enable = true;

            # Run Plasma in X11 session
            defaultSession = "plasmax11";

            # Enable automatic login for the user.
            autoLogin.enable = true;
            autoLogin.user = "yuval";
        };
    };
}
