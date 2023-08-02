FROM ghcr.io/runcodes-icmc/compiler-images-base:latest

# Configure Timezone
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install language-specific dependencies
RUN apt-get install -y gcc g++ r-base r-base-dev \
    r-recommended littler libssl-dev libcurl4-openssl-dev \
    libssh2-1-dev make

# Clean Up
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Setup R
COPY install_packages.r /bin/install_packages.r
COPY run_codes_functions.r /bin/run_codes_functions.r
RUN Rscript --silent --slave --vanilla /bin/install_packages.r

# Load script
COPY ./r-script.sh /tmp/script.sh
RUN cat /tmp/script.sh >> /usr/bin/runcodes
RUN rm /tmp/script.sh

WORKDIR /root

CMD "/usr/bin/runcodes"
