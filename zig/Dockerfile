FROM fedora:43
# fedora <3

# Install language-specific dependencies
RUN dnf install -y zig make

# Load script
COPY ./zig-script.sh /tmp/script.sh

RUN cat /tmp/script.sh >> /usr/bin/runcodes &&\
    rm /tmp/script.sh

WORKDIR /root

CMD [ "/usr/bin/runcodes" ]
