FROM debian:trixie-slim AS base

# Load Monitor Binary
COPY --from=ghcr.io/runcodes-icmc/compiler-monitor:latest /usr/bin/monitor /usr/bin/monitor

# Load Base Execution Script
COPY ./base-script.sh /usr/bin/runcodes

RUN chmod +x /usr/bin/runcodes
