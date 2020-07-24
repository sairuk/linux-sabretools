FROM alpine:3.12
ARG USER=sabretools
ARG UID=1004
ENV ENV="/home/${USER}/.ashrc"

RUN    apk add --no-cache --virtual=.build-dependencies ca-certificates \
    && apk add --no-cache icu \
    && apk add --no-cache libintl \
    && apk add --no-cache libstdc++ \
    && apk add --no-cache libgcc \
    && apk add --no-cache unzip \
    && apk add --no-cache p7zip \
    && apk del .build-dependencies

RUN adduser --disabled-password --shell /bin/bash --uid ${UID} --home /home/${USER} ${USER}

COPY install-sabre /tmp/install-sabre

RUN chown ${USER}:${USER} /opt \
    && chmod +x /tmp/install-sabre \
    && /tmp/install-sabre

USER ${USER}
WORKDIR /home/${USER}


