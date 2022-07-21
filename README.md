# Docker monerod

A simple Docker container that runs monerod so you can connect your Monero GUI to your own, full node.

This is very much in the early stages of development. This is something I threw together as quickly as possible as I wanted to stop using my big old server and use a Raspberry Pi stack instead. No regrets! I love this setup!

## Environment

Built for arm64 (will be multi-arch eventually, promise)

## System Requirements

- HDD: 150GB
- RAM: 512MB

Once fully synced, disk space usage will be around 130GB.

I highly recommend syncing to an SSD, even an external USB 3 drive. Syncing to a spinning disk is impossibly slow when it comes to syncing your client/GUI.

I have this running perfectly on a Raspberry Pi 4B 8GB and syncing to an external SSD.

### Limit RAM Usage

I recommend limiting the RAM usage of the container, otherwise the Monero database will cache as much as it can until there's no memory left. You can do this by using the ```mem_limit``` option in your compose file (see docker-compose-sample.yml for example).