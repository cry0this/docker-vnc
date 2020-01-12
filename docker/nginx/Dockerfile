FROM nginx:1.17.7-alpine
RUN mkdir -p /var/www/novnc \
&& wget -O /tmp/novnc.tgz https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz \
&& tar -C /var/www/novnc --strip-components=1 -xf /tmp/novnc.tgz \
&& rm /tmp/novnc.tgz \