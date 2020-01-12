#!/bin/sh
/usr/bin/Xvfb :1 -screen 0 ${VNC_RESOLUTION}x${VNC_COL_DEPTH} &
sleep 5 
/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -display :1 -nopw -wait 5 -shared -permitfiletransfer -tightfilexfer -forever -passwd ${VNC_PASSWORD}
