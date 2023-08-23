FROM ghcr.io/runcodes-icmc/compiler-images-base:latest AS base

# System Upgrade
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y make

FROM base AS builder

WORKDIR /

# Install Build Deps
RUN apt-get install -y \
    curl gcc g++ gfortran make texinfo xz-utils \
    libarpack2-dev libfftw3-dev libhdf5-dev liblapack-dev \
    libopenblas-dev libpcre3-dev libqhull-dev libsuitesparse-dev \
    zlib1g-dev

# Download and build Octave from source
RUN curl -L https://ftp.gnu.org/gnu/octave/octave-8.3.0.tar.xz | tar xJf -
RUN mv octave-8.3.0 octave
WORKDIR /octave


# Prepare build
RUN ./configure --disable-gui --disable-java --disable-readline \
    --disable-install-build-logs --without-x

# Build
RUN make

# Final runtime image
FROM builder AS dist

# Clean Up
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Copy Octave from builder
COPY --from=builder /octave /octave

# Install Octave
RUN cd /octave && make install && make clean

# Clean Up
RUN cd / && rm -rf /octave

# Load script
COPY ./octave-script.sh /tmp/script.sh
RUN cat /tmp/script.sh >> /usr/bin/runcodes
RUN rm /tmp/script.sh

WORKDIR /root

CMD "/usr/bin/runcodes"