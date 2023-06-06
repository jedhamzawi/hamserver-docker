# hamserver-docker

A simple docker-based setup for my personal homelab. This includes many changes specific to my system, but hopefully it can provide inspiration for how to configure services on your sever!

## Features

### :books: Organized
All non-ephemeral container data is stored in a separate `$CACHE` directory while configuration, secrets, and environment files are stored with `docker-compose.yml`. To take down a service, you just need to navigate to its directory and run `docker compose down`; no worrying about container id's, no complicated `docker run` commands.

### :closed_lock_with_key: Proper Networking
Many homelab-ers tend to run their Docker containers in `host` network mode, meaning all of the containers ports are shared with the host ports. This greatly increases the surface area for attacks and uses ports on your machine that might not need to be used. I prefer to use Caddy as a reverse proxy for any service I need to access, whether that be through the internet using certificates signed through Let's Encrypt or on my LAN using Caddy's self-signing functionality. All communication between containers happens within Docker networks, and I don't need to remember arbitrary port numbers or IP addresses.

### :recycle: Automatic Updates
Rather than installing a separate service such as Watchtower to automatically update containers, I created a simple script, [update.sh](/auto-update/update.sh), to update all containers by running `docker compose pull; docker compose up -d` in all directories under `/auto-update`. Services like `Nextcloud` and `Immich` can break if care isn't taken when updating, so those live outside of the `auto-update` directory.

## List of services

### Active
- [Adguard Home](https://hub.docker.com/r/adguard/adguardhome) (DNS)
- [Caddy](https://github.com/caddyserver/caddy) (Reverse Proxy)
- Media Stack:
  -  [Sonarr](https://github.com/Sonarr/Sonarr) (TV)
  -  [Radarr](https://github.com/Radarr/Radarr) (Movies)
  -  [Lidarr](https://github.com/Lidarr/Lidarr) (Music)
  -  [Bazarr](https://github.com/morpheus65535/bazarr) (Subtitles)
  -  [Prowlarr](https://github.com/Prowlarr/Prowlarr) (Indexers)
  -  [Deluge](https://github.com/linuxserver/docker-deluge) (Download Client running behind a VPN)
  -  [Flaresolverr](https://github.com/FlareSolverr/FlareSolverr)
-  [Ombi](https://github.com/Ombi-app/Ombi) (Media Request Management)
-  [Plex](https://hub.docker.com/r/plexinc/pms-docker/) (Media Server)
-  [Syncthing](https://github.com/syncthing/syncthing) (Syncing Client)
-  [Vaultwarden](https://github.com/dani-garcia/vaultwarden) (Password Manager)
-  [Immich](https://github.com/immich-app/immich) (Photo Server)
-  [Nextcloud](https://hub.docker.com/_/nextcloud/) (File Server)

### Inactive
- Calibre
- Code-Server
- Filerun
- Firefly
- Homepage
- Hugo
- Librephotos
- Photoview
- Pihole
- Seafile
- Whoogle-Search


## Contributing
If you see any configuration issues while digging through the repo, please create an issue and let me know! I would love to learn how I can improve and secure my beloved homelab. :grinning: