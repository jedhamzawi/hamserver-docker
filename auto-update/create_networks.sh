#!/bin/bash

ProxyNetworks="media_dl ombi radicale vaultwarden nextcloud immich adguardhome"

docker network create media_dl_net
for network in ${ProxyNetworks}; do
    docker network create "$network"_proxy
done
