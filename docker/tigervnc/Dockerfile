FROM i386/ubuntu:18.04
RUN apt update \
&& DEBIAN_FRONTEND=noninteractive apt install -y tigervnc-standalone-server tinywm wine-stable language-pack-ru ffmpeg pulseaudio \
&& apt clean
RUN groupadd -g 1000 ubuntu \
&& useradd -u 1000 -g ubuntu -s /bin/bash -m ubuntu   \
&& echo "ubuntu:ubuntu" | /usr/sbin/chpasswd 
ENV HOME="/home/ubuntu" DISPLAY=":1" USER="ubuntu"
ENV VNC_RESOLUTION="1280x720" VNC_COL_DEPTH="24" VNC_PASSWORD="vncpassword"
EXPOSE 5901
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
USER 1000
STOPSIGNAL SIGKILL
ENTRYPOINT [ "/entrypoint.sh" ]