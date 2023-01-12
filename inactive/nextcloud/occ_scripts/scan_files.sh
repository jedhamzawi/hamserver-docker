#!/bin/bash
docker exec -u www-data -it nextcloud php occ files:scan --all
