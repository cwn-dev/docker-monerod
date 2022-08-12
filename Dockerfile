FROM debian:stretch-slim

RUN apt update && \
    apt install -y --no-install-recommends wget bzip2 tar && \
    mkdir -p /monero/blockchain-data && \
    mkdir /monero/cli && \
    wget https://downloads.getmonero.org/cli/linuxarm8 -O /monero/monero.tar.bz2 && \
    tar -xvf monero.tar.bz2 --strip 1 -C /monero/cli && \
    chmod +x /monero/cli/monerod && \
    rm /monero/monero.tar.bz2

# Todo: verify the downloaded tar with certificate.

HEALTHCHECK CMD wget --no-verbose --tries=1 --spider http://localhost:18081/get_info || exit 1

EXPOSE 18080 18081

ENTRYPOINT ["/monero/cli/monerod", "--data-dir", "/monero/blockchain-data", "--non-interactive", "--rpc-bind-ip", "0.0.0.0", "--confirm-external-bind"]