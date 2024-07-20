FROM rocky-8.6

# Set root passwd
RUN echo 'root:123123' | chpasswd

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked dnf -y install epel-release

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked dnf -y install util-linux

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf -y install \
        alsa-lib apr apr-util dbus-libs fontconfig freetype \
        libglvnd libglvnd-egl libglvnd-glx libglvnd-opengl libgomp \
        libICE librsvg2 libSM libX11 libXau libxcb libXcursor \
        libXext libXfixes libXi libXinerama libxkbcommon \
        libxkbcommon-x11 libXrandr libXrender libXtst libXxf86vm \
        mesa-libGLU mtdev pulseaudio-libs xcb-util xcb-util-cursor \
        xcb-util-image xcb-util-keysyms xcb-util-renderutil \
        xcb-util-wm

