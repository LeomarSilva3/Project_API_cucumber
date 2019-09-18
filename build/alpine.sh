echo "http://dl-4.alpinelinux.org/alpine/v3.10/main" >> /etc/apk/repositories && \
echo "http://dl-4.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories

apk update && \
    apk add build-base \
    apk --update add --no-cache --virtual run-dependencies \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    curl unzip libexif udev chromium chromium-chromedriver wait4ports xvfb xorg-server dbus ttf-freefont mesa-dri-swrast \
    && rm -rf /var/cache/apk/*