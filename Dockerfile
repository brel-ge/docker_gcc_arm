FROM ubuntu:17.10
MAINTAINER Uwe Kaiser <uwe.kaiser@brel.ch>

ENV ARM_SDK_NAME="gcc-arm-none-eabi-7-2017-q4-major"
ENV ARM_SDK_FILE="${ARM_SDK_NAME}-linux.tar.bz2"
ENV ARM_SDK_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/${ARM_SDK_FILE}"
ENV JLINK_DEB="JLink_Linux_V622d_x86_64.deb"
ENV JLINK_URL="https://www.segger.com/downloads/jlink/${JLINK_DEB}"

RUN apt-get update \
&&  apt-get install  -y \
    build-essential \
    cmake \ 
    doxygen \
    git \
    lcov \
    curl \
    python3 \
    bzip2 \
    wget \
    psmisc \
    ninja-build \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*  \
&& curl -L ${ARM_SDK_URL} -o /tmp/${ARM_SDK_FILE} \
&& mkdir -p /opt \
&& cd /opt; tar xjf /tmp/${ARM_SDK_FILE} \
&& wget --post-data="accept_license_agreement=accepted&submit=Download+software" ${JLINK_URL} -O ${JLINK_DEB} \
&& dpkg -i ${JLINK_DEB}

VOLUME /dev/bus/usb:/dev/bus/usb
