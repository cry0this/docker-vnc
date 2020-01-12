#!/bin/bash
if [[ -f /app/cert/cert.pem ]]; then 
  /app/utils/launch.sh --vnc ${VNC_HOST}:${VNC_PORT} --listen ${NOVNC_PORT} --cert /app/cert/cert.pem --ssl-only
else 
  /app/utils/launch.sh --vnc ${VNC_HOST}:${VNC_PORT} --listen ${NOVNC_PORT} --cert
fi