{ pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
        pavucontrol # GUI sound control
    ];

    # rtkit is optional but recommended
    security.rtkit.enable = true;

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