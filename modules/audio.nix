{ pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
        pavucontrol # GUI sound control
    ];

    # rtkit is optional but recommended
    security.rtkit.enable = true;

    # Disabling the pulseaudio daemon, enabling support through pipewire
    services.pulseaudio.enable = false;

    services.pipewire = {
        enable = true;

        pulse.enable = true;
        jack.enable = true;
        audio.enable = true;

        # Support for pulseaudio
        wireplumber.enable = true;

        alsa = {
            enable = true;
            support32Bit = true;
        };
    };
}