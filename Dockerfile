FROM alpine:latest

RUN apk add --no-cache curl unzip && \
    mkdir -p /etc/v2ray /usr/bin && \
    curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /tmp/v2ray && \
    mv /tmp/v2ray/v2ray /usr/bin/v2ray && \
    mv /tmp/v2ray/v2ctl /usr/bin/v2ctl && \
    mv /tmp/v2ray/*.dat /usr/bin && \
    chmod +x /usr/bin/v2ray /usr/bin/v2ctl && \
    rm -rf /tmp/*

COPY config.json /etc/v2ray/config.json

EXPOSE 1080 8080 443

CMD ["v2ray", "-config", "/etc/v2ray/config.json"]