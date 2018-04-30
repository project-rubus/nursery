FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install \
        bsdtar \
        curl \
        debootstrap \
        dosfstools \
        git \
        grep \
        libcap2-bin \
        parted \
        pxz \
        qemu-user-static \
        quilt \
        realpath \
        rsync \
        udev \
        vim \
        xxd \
        xz-utils \
        zerofree \
        zip \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/RPi-Distro/pi-gen /pi-gen

WORKDIR /pi-gen
VOLUME /pi-gen/work
VOLUME /pi-gen/deploy
