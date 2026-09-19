{
  alsa-lib,
  autoPatchelfHook,
  buildFHSEnv,
  elfutils,
  extraEnv ? { },
  fetchurl,
  ffmpeg_6-headless,
  lib,
  libdrm,
  libedit,
  libgbm,
  libpulseaudio,
  libva,
  libxkbcommon,
  libxml2_13,
  makeDesktopItem,
  makeShellWrapper,
  minizip,
  nss,
  squashfsTools,
  stdenv,
  writeShellScript,
  xkeyboard_config,
  libxcb-wm,
  libxcb-render-util,
  libxcb-keysyms,
  libxcb-image,
  libxtst,
  libxrender,
  libxrandr,
  libxinerama,
  libxdamage,
  libxcomposite,
  xrandr,
  libxshmfence,
  libglvnd,
  mesa,
}:
let
  pname = "plex-desktop";
  version = "1.112.0";
  rev = "87";
  meta = {
    homepage = "https://plex.tv/";
    description = "Streaming media player for Plex";
    longDescription = ''
      Plex for Linux is your client for playback on the Linux
      desktop. It features the point and click interface you see in your browser
      but uses a more powerful playback engine as well as
      some other advance features.
    '';
    maintainers = with lib.maintainers; [ detroyejr ];
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "plex-desktop";
  };
  desktopItem = makeDesktopItem {
    name = "plex-desktop";
    desktopName = "Plex";
    exec = "plex-desktop";
    icon = "plex-desktop";
    terminal = false;
    categories = [ "AudioVideo" ];
    startupWMClass = "Plex";
  };
  plex-desktop = stdenv.mkDerivation {
    inherit pname version meta;

    src = fetchurl {
      url = "https://api.snapcraft.io/api/v1/snaps/download/qc6MFRM433ZhI1XjVzErdHivhSOhlpf0_${rev}.snap";
      hash = "sha512-xDBnqPkYIpSsUe+X6oalecNz1bsX0O3pXUTI9GBZLAsT+4U4qdovn2ILPh4APJaqwNEswoIYepkjTSmm9pOI9A==";
    };

    nativeBuildInputs = [
      autoPatchelfHook
      makeShellWrapper
      squashfsTools
    ];

    buildInputs = [
      elfutils
      ffmpeg_6-headless
      libedit
      libgbm
      libpulseaudio
      libva
      libxkbcommon
      libxml2_13
      minizip
      nss
      stdenv.cc.cc
      libxcomposite
      libxdamage
      libxinerama
      libxrandr
      libxrender
      libxtst
      libxshmfence
      libxcb-image
      libxcb-keysyms
      libxcb-render-util
      libxcb-wm
      xrandr
    ];

    strictDeps = true;

    unpackPhase = ''
      runHook preUnpack
      unsquashfs "$src"
      cd squashfs-root
      runHook postUnpack
    '';

    dontWrapQtApps = true;

    installPhase = ''
      runHook preInstall

      cp -r . $out
      rm -r $out/etc
      rm -r $out/usr

      # flatpak removes these during installation.
      rm -r $out/lib/dri
      rm $out/lib/libpciaccess.so*
      rm $out/lib/libswresample.so*
      rm $out/lib/libva-*.so*
      rm $out/lib/libva.so*
      rm $out/lib/libEGL.so*
      rm $out/lib/libdrm.so*
      rm $out/lib/libdrm*

      # Keep dependencies where the version from nixpkgs is higher.
      cp usr/lib/x86_64-linux-gnu/libasound.so.2 $out/lib/libasound.so.2
      cp usr/lib/x86_64-linux-gnu/libjbig.so.0 $out/lib/libjbig.so.0
      cp usr/lib/x86_64-linux-gnu/libjpeg.so.8 $out/lib/libjpeg.so.8
      cp usr/lib/x86_64-linux-gnu/liblcms2.so.2 $out/lib/liblcms2.so.2
      cp usr/lib/x86_64-linux-gnu/libpci.so.3.6.4 $out/lib/libpci.so.3
      cp usr/lib/x86_64-linux-gnu/libsnappy.so.1.1.8 $out/lib/libsnappy.so.1
      cp usr/lib/x86_64-linux-gnu/libtiff.so.5 $out/lib/libtiff.so.5
      cp usr/lib/x86_64-linux-gnu/libwebp.so.6 $out/lib/libwebp.so.6
      cp usr/lib/x86_64-linux-gnu/libxkbfile.so.1.0.2 $out/lib/libxkbfile.so.1
      cp usr/lib/x86_64-linux-gnu/libxslt.so.1.1.34 $out/lib/libxslt.so.1

      runHook postInstall
    '';
  };
in
buildFHSEnv {
  inherit pname version meta;
  targetPkgs = pkgs: [
    alsa-lib
    libdrm
    libglvnd
    mesa
    xkeyboard_config
  ];

  extraInstallCommands = ''
    mkdir -p $out/share/applications $out/share/icons/hicolor/scalable/apps
    install -m 444 -D ${desktopItem}/share/applications/plex-desktop.desktop $out/share/applications/plex-desktop.desktop
    install -m 444 -D ${plex-desktop}/meta/gui/icon.png $out/share/icons/hicolor/scalable/apps/plex-desktop.png
  '';

  runScript = writeShellScript "plex-desktop.sh" ''
    # Widevine won't download unless this directory exists.
    mkdir -p $HOME/.cache/plex/

    # Copy the sqlite plugin database on first run.
    PLEX_DB="$HOME/.local/share/plex/Plex Media Server/Plug-in Support/Databases"
    if [[ ! -d "$PLEX_DB" ]]; then
      mkdir -p "$PLEX_DB"
      cp "${plex-desktop}/resources/com.plexapp.plugins.library.db" "$PLEX_DB"
    fi

    # db files should have write access.
    chmod --recursive 750 "$PLEX_DB"

    # These environment variables sometimes silently cause plex to crash.
    unset QT_QPA_PLATFORM QT_STYLE_OVERRIDE

    # Point EGL/DRI to the NixOS OpenGL driver (needed for NVIDIA inside the FHS sandbox).
    export LIBGL_DRIVERS_PATH=/run/opengl-driver/lib/dri
    export LIBVA_DRIVERS_PATH=/run/opengl-driver/lib/dri
    export __EGL_VENDOR_LIBRARY_DIRS=/run/opengl-driver/share/glvnd/egl_vendor.d
    export LD_LIBRARY_PATH=/run/opengl-driver/lib:$LD_LIBRARY_PATH

    # Override Chromium GPU blocklist so QtWebEngine can use the NVIDIA GPU.
    export QTWEBENGINE_CHROMIUM_FLAGS="--disable-gpu-sandbox"

    # Plex.sh sets LD_LIBRARY_PATH to its bundled Qt 6.2 libs. Child processes
    # like xdg-open/kde-open inherit this and fail because KDE frameworks
    # require Qt 6.11. Create wrappers that clear LD_LIBRARY_PATH before
    # calling the real binaries.
    WRAPPER_DIR=$(mktemp -d)
    for cmd in xdg-open kde-open kde-open5 kde-open6; do
      real_cmd=$(command -v "$cmd" 2>/dev/null || true)
      if [ -n "$real_cmd" ]; then
        cat > "$WRAPPER_DIR/$cmd" <<WRAP
#!/bin/sh
unset LD_LIBRARY_PATH
exec "$real_cmd" "\$@"
WRAP
        chmod +x "$WRAPPER_DIR/$cmd"
      fi
    done
    export PATH="$WRAPPER_DIR:$PATH"

    set -o allexport
    ${lib.toShellVars extraEnv}
    exec ${plex-desktop}/Plex.sh
  '';
  passthru.updateScript = ./update.sh;
}
