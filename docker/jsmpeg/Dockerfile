FROM node:10.18.1-alpine3.11
RUN npm -g install http-server
WORKDIR /app
RUN apk update && \
apk --no-cache add git
RUN git clone https://github.com/phoboslab/jsmpeg.git
RUN npm install ws
EXPOSE 8081 8082
STOPSIGNAL SIGKILL
CMD node jsmpeg/websocket-relay.js audio 8081 8082

