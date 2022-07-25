FROM alpine

LABEL Justin Tien <thitbbeb@gmail.com>

ENV RC_VERSION=current
ENV ARCH=amd64

RUN apk update \
    && apk add \
        openssl \
        ca-certificates \
        fuse \
    && cd /tmp \
    && wget -q http://downloads.rclone.org/rclone-${RC_VERSION}-linux-${ARCH}.zip \
    && unzip /tmp/rclone-${RC_VERSION}-linux-${ARCH}.zip \
    && mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
    && rm -r /tmp/rclone* \
    && addgroup rclone \
    && adduser -h /config -s /bin/ash -G rclone -D rclone

USER rclone

VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/rclone"]

CMD ["--version"]
