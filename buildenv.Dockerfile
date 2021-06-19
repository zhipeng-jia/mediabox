FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=America/Chicago

RUN apt -y update; apt -y upgrade

# Install build tools
RUN apt -y install \
    g++ \
    cmake \
    make \
    pkg-config \
    autoconf \
    automake \
    libtool \
    curl \
    unzip \
    nasm \
    yasm \
    python3 \
    cython3

# Install deps
RUN apt -y install \
    libfreetype-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libfontconfig1-dev \
    python3-dev

RUN apt -y clean

RUN mkdir /builddir

COPY ./build-ffmpeg /usr/local/bin

WORKDIR /builddir
ENTRYPOINT ["/usr/local/bin/build-ffmpeg"]
CMD ["--build"]
