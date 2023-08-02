FROM eclipse-temurin:8-jdk-jammy

# Load base executables
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/monitor /usr/bin/monitor
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/runcodes /usr/bin/runcodes

# System Upgrade
RUN apt-get update -y
RUN apt-get upgrade -y

# Install Portugol
RUN mkdir /bin/portugol
COPY portugol /bin/portugol

# Clean Up
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Load script
COPY ./portugol-script.sh /tmp/script.sh
RUN cat /tmp/script.sh >> /usr/bin/runcodes
RUN rm /tmp/script.sh

WORKDIR /root

CMD "/usr/bin/runcodes"