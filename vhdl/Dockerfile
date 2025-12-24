FROM ghdl/ghdl:bookworm-gcc-12.3.0

# Load base executables
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/monitor /usr/bin/monitor
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/runcodes /usr/bin/runcodes

RUN apt-get update &&\
		apt-get install -y make &&\
		apt-get clean &&\
		rm -rf /var/lib/apt/lists/*

# Load script
COPY ./vhdl-script.sh /tmp/script.sh

RUN cat /tmp/script.sh >> /usr/bin/runcodes &&\
		rm /tmp/script.sh

WORKDIR /root

CMD ["/usr/bin/runcodes"]
