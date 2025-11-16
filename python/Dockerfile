FROM python:3.13.7-slim-trixie
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

# Install PyPI packages
RUN pip install --no-cache-dir numpy scipy imageio nltk scikit-image matplotlib pyscipopt pymcdc coverage

# Load script
COPY ./python-script.sh /tmp/script.sh
RUN cat /tmp/script.sh >> /usr/bin/runcodes
RUN rm /tmp/script.sh

WORKDIR /root

CMD "/usr/bin/runcodes"
