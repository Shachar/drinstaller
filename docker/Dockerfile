FROM rocky-8.6

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked dnf -y install util-linux

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked \
    dnf -y install \
        alsa-lib apr apr-util dbus-libs fontconfig freetype \
        libglvnd libglvnd-egl libglvnd-glx libglvnd-opengl libgomp \
        libICE librsvg2 libSM libX11 libXau libxcb libXcursor \
        libXext libXfixes libXi libXinerama libxkbcommon \
        libxkbcommon-x11 libXrandr libXrender libXtst libXxf86vm \
        mesa-libGLU mtdev pulseaudio-libs xcb-util \
        xcb-util-image xcb-util-keysyms xcb-util-renderutil \
        xcb-util-wm ocl-icd usbutils

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked dnf -y install epel-release

RUN --mount=type=cache,target=/var/cache/dnf,sharing=locked dnf -y install xcb-util-cursor

ADD --chown=0:0 --chmod=644 pkexec /usr/bin
RUN ln -s /opt/drinstaller/proxy-cmd /usr/bin/xdg-icon-resource 
RUN ln -s /opt/drinstaller/proxy-cmd /usr/bin/xdg-mime
RUN ln -s /opt/drinstaller/proxy-cmd /usr/bin/gtk-update-icon-cache
RUN ln -s /opt/drinstaller/proxy-cmd /usr/sbin/udevadm
RUN ln -s /opt/drinstaller/lib64/libDaVinciPanelAPI.so /usr/lib64/libDaVinciPanelAPI.so
RUN ln -s /opt/drinstaller/lib64/libFairlightPanelAPI.so /usr/lib64/libFairlightPanelAPI.so

RUN mkdir /usr/lib64/lib
RUN mkdir /var/BlackmagicDesign
