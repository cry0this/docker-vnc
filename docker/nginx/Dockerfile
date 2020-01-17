ARG NGINX_VERSION=1.16.1
ARG NGINX_RTMP_VERSION=1.2.1

##############################
# Build the NGINX-build image.
FROM alpine:3.8 as build-nginx
ARG NGINX_VERSION
ARG NGINX_RTMP_VERSION

# Build dependencies.
RUN apk add --update \
  build-base \
  ca-certificates \
  curl \
  gcc \
  libc-dev \
  libgcc \
  linux-headers \
  make \
  musl-dev \
  openssl \
  openssl-dev \
  pcre \
  pcre-dev \
  pkgconf \
  pkgconfig \
  zlib-dev

# Get nginx source.
RUN cd /tmp && \
  wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
  tar zxf nginx-${NGINX_VERSION}.tar.gz && \
  rm nginx-${NGINX_VERSION}.tar.gz

# Get nginx-rtmp module.
RUN cd /tmp && \
  wget https://github.com/arut/nginx-rtmp-module/archive/v${NGINX_RTMP_VERSION}.tar.gz && \
  tar zxf v${NGINX_RTMP_VERSION}.tar.gz && rm v${NGINX_RTMP_VERSION}.tar.gz

# Compile nginx with nginx-rtmp module.
RUN cd /tmp/nginx-${NGINX_VERSION} && \
  ./configure \
  --prefix=/usr/local/nginx \
  --add-module=/tmp/nginx-rtmp-module-${NGINX_RTMP_VERSION} \
  --conf-path=/etc/nginx/nginx.conf \
  --with-threads \
  --with-file-aio \
  --with-http_ssl_module \
  --with-debug && \
  cd /tmp/nginx-${NGINX_VERSION} && make && make install

# Cleanup.
RUN rm -rf /var/cache/* /tmp/*

##########################
# Build the release image.
FROM alpine:3.8

RUN apk add --update \
  ca-certificates \
  openssl \
  pcre \
  lame \
  libogg \
  libass \
  libvpx \
  libvorbis \
  libwebp \
  libtheora \
  opus \
  rtmpdump \
  x264-dev \
  x265-dev \
  wget

COPY --from=build-nginx /usr/local/nginx /usr/local/nginx

# Add NGINX path, config and static files.
ENV PATH "${PATH}:/usr/local/nginx/sbin"
ADD nginx.conf /etc/nginx/nginx.conf
ADD mime.types /etc/nginx/mime.types
RUN mkdir -p /opt/data && mkdir /www

RUN wget -O /tmp/novnc.tgz https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz \
&& mkdir -p /var/www/novnc \
&& tar -C /var/www/novnc --strip-components=1 -xf /tmp/novnc.tgz \
&& sed -i -- "s/UI.initSetting('resize', 'off');/UI.initSetting('resize', 'scale');/g" /var/www/novnc/app/ui.js \
&& rm /tmp/novnc.tgz

ADD vnc.html /var/www/novnc/
ADD hls.js /var/www/novnc/

EXPOSE 1935
EXPOSE 80 443

CMD ["nginx"]
