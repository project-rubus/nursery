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

ENV PI_GEN_REF 2018-03-13-raspbian-stretch

RUN git clone https://github.com/RPi-Distro/pi-gen /pi-gen && \
    git -C /pi-gen checkout -b rubus $PI_GEN_REF
