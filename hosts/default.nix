{ pkgs, inputs, ... }:

{    
    system.stateVersion = "unstable"; # NixPkgs Version
    nixpkgs.config.allowUnfree = true; # Allow unfree packages
    
    nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enable flakes

    # Bootloader.
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    # services.openssh.enable = true; # Enable the OpenSSH daemon.

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.yuval = {
        isNormalUser = true;
        description = "Yuval Maron";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    time.timeZone = "Asia/Jerusalem"; # Set your time zone.
    i18n.defaultLocale = "en_IL"; # Select internationalisation properties.

    networking.networkmanager.enable = true; # Enable networking
    services.printing.enable = true; # Enable CUPS to print documents.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
}