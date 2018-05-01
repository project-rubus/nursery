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


apt-get -y install \
        python3 \
        python3-docopt


PI_SRC=/pi-gen
if [ ! -d $PI_SRC/.git ]; then
    sudo -u vagrant git clone https://github.com/RPi-Distro/pi-gen $PI_SRC
else
    sudo -u vagrant git -C $PI_SRC fetch
    sudo -u vagrant git -C $PI_SRC checkout master
    sudo -u vagrant git -C $PI_SRC reset --hard origin/master
fi
