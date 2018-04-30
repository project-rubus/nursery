#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get -y update
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
        zerofree \
        pxz \
        zip


sudo -u vagrant git clone https://github.com/RPi-Distro/pi-gen /pi-gen
