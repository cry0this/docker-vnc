FROM alpine:3.11
RUN apk update \
&& apk --no-cache add python \
&& rm -rf /tmp/* /var/cache/apk/*
WORKDIR /app
RUN wget -O /tmp/websockify.tgz https://github.com/novnc/websockify/archive/v0.9.0.tar.gz \
&& tar -C /app --strip-components=1 -xf /tmp/websockify.tgz \
&& rm /tmp/websockify.tgz
ENV VNC_HOST=localhost VNC_PORT=5900 NOVNC_PORT=6900
ADD entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh
EXPOSE 6900
STOPSIGNAL SIGKILL
ENTRYPOINT [ "/app/entrypoint.sh" ]