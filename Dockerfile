FROM golang:latest 
MAINTAINER yshurik <yshurik@gmail.com>

RUN apt update
RUN apt-get -y install \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    pkg-config \
    python \
    ruby \
    scons \
    sed \
    unzip \
    wget \
    xz-utils
WORKDIR /
RUN echo mark1
RUN git clone https://github.com/yshurik/mxe.git
WORKDIR /mxe

ENV TARGETS "x86_64-w64-mingw32.shared x86_64-w64-mingw32.static"
RUN make -j4 download-gcc
RUN make -j32 MXE_TARGETS="$TARGETS" gcc
RUN make -j32 MXE_TARGETS="$TARGETS" cmake
RUN make -j32 MXE_TARGETS="$TARGETS" freetype
RUN make -j32 MXE_TARGETS="$TARGETS" fontconfig
RUN make -j32 MXE_TARGETS="$TARGETS" sqlite
RUN make -j32 MXE_TARGETS="$TARGETS" freetds
RUN make -j32 MXE_TARGETS="$TARGETS" postgresql
RUN make -j32 MXE_TARGETS="$TARGETS" libmysqlclient
RUN make -j32 MXE_TARGETS="$TARGETS" jpeg pcre2


