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
        qemu-user-static \
        quilt \
        realpath \
        rsync \
        udev \
        vim \
        xxd \
        xz-utils \
        zerofree pxz \
        zip \
    && rm -rf /var/lib/apt/lists/*
