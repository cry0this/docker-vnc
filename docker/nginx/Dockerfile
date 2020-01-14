FROM nginx:1.17.7-alpine
RUN wget -O /tmp/novnc.tgz https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz \
&& mkdir -p /var/www/ \
&& tar -C /var/www/ -xf /tmp/novnc.tgz \
&& sed -i -- "s/UI.initSetting('resize', 'off');/UI.initSetting('resize', 'scale');/g" /var/www/noVNC-1.1.0/app/ui.js \
&& rm /tmp/novnc.tgz