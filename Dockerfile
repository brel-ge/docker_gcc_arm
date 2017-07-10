FROM ubuntu:16.10
MAINTAINER Uwe Kaiser <uwe.kaiser@brel.ch>

ENV ARM_SDK_NAME="gcc-arm-none-eabi-6-2017-q2-update"
ENV ARM_SDK_FILE="${ARM_SDK_NAME}-linux.tar.bz2"
ENV ARM_SDK_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/${ARM_SDK_FILE}"

RUN apt-get update \
&&  apt-get install  -y \
    build-essential \
    cmake \ 
    doxygen \
    git \
    lcov \
    curl \
    python \
    bzip2 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*  \
&& curl -L ${ARM_SDK_URL} -o /tmp/${ARM_SDK_FILE} \
&& mkdir -p /opt \
&& cd /opt; tar xjf /tmp/${ARM_SDK_FILE}
