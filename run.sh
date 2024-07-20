#!/bin/sh

UID=`id -u`
GID=`id -g`
INSTALLER="`realpath "$1"`"
docker run --mount type=bind,source=/dev,destination=/dev --mount type=bind,source=/tmp,destination=/tmp,readonly=false --mount type=bind,source=/home,destination=/home --mount type=bind,source=/opt,destination=/opt -u $UID:$GID -e HOME="$HOME" -e DISPLAY="$DISPLAY" -it drrocky -w /tmp "$INSTALLER" --appimage-extract-and-run
