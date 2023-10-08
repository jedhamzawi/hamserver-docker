#!/bin/bash

ProxyNetworks="media_dl ombi radicale vaultwarden nextcloud immich adguardhome"

docker network inspect media_dl_net
for network in ${ProxyNetworks}; do
    docker network inspect "$network"_proxy
done
