#!/bin/bash

pulseaudio -n -v \
            --load=module-native-protocol-unix \
            --load=module-always-sink \
            --start

ffmpeg -f pulse -i default -fflags nobuffer -c:a mp2 -ar 44100 -ab 128k -f mpegts http://jsmpeg:8081/audio &> /dev/null &

if [[ ! -d /home/ubuntu/.vnc ]]; then 
  mkdir /home/ubuntu/.vnc
fi
vncserver -kill :1
echo "${VNC_PASSWORD}" | vncpasswd -f > /home/ubuntu/.vnc/passwd
vncserver :1 -depth ${VNC_COL_DEPTH} -geometry ${VNC_RESOLUTION} -cleanstale -fg -localhost no -SecurityTypes VNCAuth,TLSVnc -passwd /home/ubuntu/.vnc/passwd -xstartup tinywm
