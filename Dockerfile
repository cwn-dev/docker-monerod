FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y wget bzip2 tar

EXPOSE 18080 18081

RUN mkdir -p /monero/blockchain-data

WORKDIR /monero
RUN wget https://downloads.getmonero.org/cli/linuxarm8 -O /monero/monero.tar.bz2
RUN tar -xvf monero.tar.bz2 -C ./

# Todo: verify the downloaded tar with certificate.

HEALTHCHECK CMD wget --no-verbose --tries=1 --spider http://localhost:18081/get_info || exit 1

RUN chmod +x /monero/monero-aarch64-linux-gnu-v0.18.0.0/monerod

ENTRYPOINT ["/monero/monero-aarch64-linux-gnu-v0.18.0.0/monerod", "--data-dir", "/monero/blockchain-data", "--non-interactive", "--rpc-bind-ip", "0.0.0.0", "--confirm-external-bind"]