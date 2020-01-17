#!/bin/bash

pulseaudio -n -v \
            --load=module-native-protocol-unix \
            --load=module-always-sink \
            --start

ffmpeg -f pulse -i default -fflags nobuffer -ac 1 -c:a aac -ar 22050 -ab 128k -f flv rtmp://nginx:1935/stream/audio &> /dev/null &

if [[ ! -d /home/ubuntu/.vnc ]]; then 
  mkdir /home/ubuntu/.vnc
fi
vncserver -kill :1
echo "${VNC_PASSWORD}" | vncpasswd -f > /home/ubuntu/.vnc/passwd
vncserver :1 -depth ${VNC_COL_DEPTH} -geometry ${VNC_RESOLUTION} -cleanstale -localhost no -fg -SecurityTypes VNCAuth,TLSVnc -passwd /home/ubuntu/.vnc/passwd -xstartup tinywm
