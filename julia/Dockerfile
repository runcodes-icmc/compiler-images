FROM julia:1.10-bookworm

# Load base executables
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/monitor /usr/bin/monitor
COPY --from=ghcr.io/runcodes-icmc/compiler-images-base:latest /usr/bin/runcodes /usr/bin/runcodes

# System Upgrade
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y make


# Install additional Julia packages (not working for now, FIX after getting julia to work)
# RUN julia -e 'using Pkg; Pkg.add("Plots")'  

# Clean Up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Load script
COPY ./julia-script.sh /tmp/script.sh
RUN cat /tmp/script.sh >> /usr/bin/runcodes
RUN rm /tmp/script.sh

WORKDIR /root

CMD ["/usr/bin/runcodes"]
