{ pkgs, ... }:

{
    services = {
        # xserver.enable = true;

        desktopManager.plasma6.enable = true;

        displayManager = {
            sddm = {
                enable = true;
                wayland.enable = true;
            };

            # Run Plasma in Wayland session
            defaultSession = "plasma";

            # Enable automatic login for the user.
            autoLogin.enable = true;
            autoLogin.user = "yuval";
        };
    };

    # Tell Electron apps to use Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # Tell Firefox to not use Wayland
    environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
    # Currently, Firefox/Wayland have a combined sort of weird bug causing frequent crashing.
    # This makes Firefox run through XWayland instead.
}
