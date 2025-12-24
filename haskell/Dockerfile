FROM ghcr.io/runcodes-icmc/compiler-images-base:latest

# Load base executables
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/monitor /usr/bin/monitor
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/runcodes /usr/bin/runcodes

# System Upgrade
RUN apt-get update -y &&\
    apt-get install -y make ghc &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*


# Load script
COPY ./haskell-script.sh /tmp/script.sh

RUN cat /tmp/script.sh >> /usr/bin/runcodes &&\
    rm /tmp/script.sh

WORKDIR /root

CMD ["/usr/bin/runcodes"]
