#!/bin/sh

UID=`id -u`
GID=`id -g`
INSTALLER="`realpath "$1"`"
VOLUMES=/dev:/tmp:/home:/opt:/usr/share/applications:/usr/share/desktop-directories:/etc/xdg:/var/BlackmagicDesign:/usr/lib/udev/rules.d

MOUNTS=''
for volume in `echo "$VOLUMES" | tr ':' ' '`
do
    MOUNTS="$MOUNTS --mount type=bind,source=$volume,destination=$volume"
done
docker run $MOUNTS -u $UID:$GID -e HOME="$HOME" -e DISPLAY="$DISPLAY" -it -w /tmp drrocky "$@"

#"$INSTALLER" --appimage-extract-and-run


# directories with changes:
# /usr/lib/udev/rules.d
# /usr/lib64/lib
# /usr/lib64/libDaVinciPanelAPI.so
# /usr/lib64/libFairlightPanelAPI.so
#
#usr/lib64/lib:
#total 2180
#dr-xr-xr-x  2 compusar 1000    4096 Jun 14 08:04 .
#dr-xr-xr-x. 1 root     root    4096 Jul 25 14:18 ..
#-r-xr-xr-x  1 compusar 1000  264616 Jun 14 08:04 libavahi-client.so.3
#-r-xr-xr-x  1 compusar 1000  178904 Jun 14 08:04 libavahi-common.so.3
#-r-xr-xr-x  1 compusar 1000 1014152 Jun 14 08:04 libc++.so.1
#-r-xr-xr-x  1 compusar 1000  309240 Jun 14 08:04 libc++abi.so.1
#-r-xr-xr-x  1 compusar 1000  132752 Jun 14 08:04 libdns_sd.so.1
#-r-xr-xr-x  1 compusar 1000  307432 Jun 14 08:04 libusb-1.0.so.0

# usr/share/applications:
# usr/share/desktop-directories:
# /var/BlackmagicDesign
