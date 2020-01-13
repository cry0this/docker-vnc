#!/bin/bash
if [[ ! -d /home/ubuntu/.vnc ]]; then 
  mkdir /home/ubuntu/.vnc
fi
vncserver -kill :1
echo "${VNC_PASSWORD}" | vncpasswd -f > /home/ubuntu/.vnc/passwd
vncserver :1 -depth ${VNC_COL_DEPTH} -geometry ${VNC_RESOLUTION} -cleanstale -localhost no -fg -SecurityTypes VNCAuth,TLSVnc -passwd /home/ubuntu/.vnc/passwd -xstartup openbox-session