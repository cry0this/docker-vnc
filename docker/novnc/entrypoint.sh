#!/bin/bash
if [[ -f /etc/cert.pem ]]; then 
  /app/utils/launch.sh --vnc ${VNC_HOST}:${VNC_PORT} --listen ${NOVNC_PORT} --cert /etc/cert.pem --ssl-only
else 
  /app/utils/launch.sh --vnc ${VNC_HOST}:${VNC_PORT} --listen ${NOVNC_PORT} --cert
fi