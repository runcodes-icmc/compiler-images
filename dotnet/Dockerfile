FROM mcr.microsoft.com/dotnet/sdk:9.0-bookworm-slim

# Load base executables
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/monitor /usr/bin/monitor
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/runcodes /usr/bin/runcodes

# System Upgrade
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y make

# Clean Up
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Load script
COPY ./dotnet-script.sh /tmp/script.sh
RUN cat /tmp/script.sh >> /usr/bin/runcodes
RUN rm /tmp/script.sh

WORKDIR /root

CMD "/usr/bin/runcodes"

