FROM i386/alpine:3.11
RUN apk update \
&& apk --no-cache add xvfb x11vnc wine \
&& rm -rf /tmp/* /var/cache/apk/*
RUN addgroup alpine \
&& adduser  -G alpine -s /bin/sh -D alpine \
&& echo "alpine:alpine" | /usr/sbin/chpasswd 
ENV HOME="/home/alpine" DISPLAY=":1" USER="alpine"
ENV VNC_RESOLUTION="1280x720" VNC_COL_DEPTH="24" VNC_PASSWORD="vncpassword"
EXPOSE 5900
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
STOPSIGNAL SIGKILL
ENTRYPOINT [ "/entrypoint.sh" ]
