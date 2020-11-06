FROM nvidia/opengl:base-ubuntu18.04
LABEL maintainer="Justin Hoppensteadt <justinrocksmadscience+git@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install  \
        curl \
        gnupg2 \
        libmpv-dev \
        mpv \
        python3-setuptools \
        python3-pip \
        software-properties-common \
        wget && \
    python3 -m pip install --upgrade pip setuptools && \
    add-apt-repository ppa:ozmartian/apps && \
    apt-get update && \
    apt-get -y install vidcutter && \
    apt-get -y -f install && \
    python3 -m pip install --upgrade PyOpenGL && \
    apt-get -y purge libmpv-dev && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/cache/apt

RUN groupadd -r -g 1000 justin && \
    useradd -d /opt -m --shell /sbin/nologin --uid 1000 -g 1000 justin && \
    mkdir /work

WORKDIR /work
USER justin
ENTRYPOINT "/usr/bin/vidcutter"
