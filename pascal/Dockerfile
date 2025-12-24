FROM ghcr.io/runcodes-icmc/compiler-images-base:latest

# Install language-specific dependencies
RUN apt-get update &&\
    apt-get install -y fp-compiler binutils make &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

# Load script
COPY ./pascal-script.sh /tmp/script.sh

RUN cat /tmp/script.sh >> /usr/bin/runcodes &&\
    rm /tmp/script.sh

WORKDIR /root

CMD ["/usr/bin/runcodes"]
