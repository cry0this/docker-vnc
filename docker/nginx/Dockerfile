FROM nginx:1.17.7-alpine
RUN wget -O /tmp/novnc.tgz https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz \
&& mkdir -p /var/www/novnc \
&& tar -C /var/www/novnc --strip-components=1 -xf /tmp/novnc.tgz \
&& rm /tmp/novnc.tgz

ADD vnc.html /var/www/novnc/
ADD jsmpeg.min.js /var/www/novnc/jsmpeg/
ADD ui.js /var/www/novnc/app/
ADD sound.svg /var/www/novnc/app/images/
ADD ru.json /var/www/novnc/app/locale/

STOPSIGNAL SIGKILL
EXPOSE 80 443