FROM alpine:3.11
RUN apk update \
&& apk --no-cache add bash git python \
&& rm -rf /tmp/* /var/cache/apk/*
WORKDIR /app
RUN wget -O /tmp/novnc.tgz https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz \
&& tar -C /app --strip-components=1 -xf /tmp/novnc.tgz \
&& rm /tmp/novnc.tgz \
&& sed -i -- "s/ps -p/ps -o pid | grep/g" /app/utils/launch.sh 
RUN wget -O /tmp/websockify.tgz https://github.com/novnc/websockify/archive/v0.9.0.tar.gz \
&& mkdir /app/utils/websockify \
&& tar -C /app/utils/websockify --strip-components=1 -xf /tmp/websockify.tgz \
&& rm /tmp/websockify.tgz
ENV VNC_HOST=localhost VNC_PORT=5900 NOVNC_PORT=6900
ADD entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh
EXPOSE 6900
STOPSIGNAL SIGKILL
ENTRYPOINT [ "/app/entrypoint.sh" ]