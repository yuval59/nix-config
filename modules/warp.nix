{ lib, pkgs, config, ... }:

let
  cfg = config.programs.warp-ade;

  # Default package: AppImage wrapper (x64)
  warpAdePkg = pkgs.appimageTools.wrapType2 {
    pname = "warp-ade";
    version = cfg.version;

    src = pkgs.fetchurl {
      # Official x64 AppImage URL
      url = "https://app.warp.dev/download?package=appimage";
      # You MUST fill this with the prefetch hash (see step 3)
      sha256 = cfg.sha256;
    };

    # Nice-to-have desktop file
    extraInstallCommands = ''
      mkdir -p $out/share/applications
      cat > $out/share/applications/warp-ade.desktop <<EOF
      [Desktop Entry]
      Name=Warp (ADE)
      Exec=warp-ade
      Type=Application
      Categories=Development;Utility;TerminalEmulator;
      EOF
    '';
  };

in {
  options.programs.warp-ade = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Warp ADE (Agentic Development Environment).";
    };

    version = lib.mkOption {
      type = lib.types.str;
      default = "latest";
      description = "Displayed version label for the AppImage wrapper.";
    };

    sha256 = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      description = ''
        sha256 of the AppImage download.
        Compute with `nix store prefetch-file <URL>` (see instructions).
      '';
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = warpAdePkg;
      description = "Override to supply a custom Warp ADE package if desired.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };
}
