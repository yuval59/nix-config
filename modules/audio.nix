{ pkgs, inputs, ... }:

{
    # rtkit is optional but recommended
    security.rtkit.enable = true;
    # Enable sound with pipewire.
    sound.enable = true;
    services.pipewire = {
        enable = true;

        pulse.enable = true;
        jack.enable = true;
        audio.enable = true;

        alsa = {
            enable = true;
            support32Bit = true;
        };
    };
}