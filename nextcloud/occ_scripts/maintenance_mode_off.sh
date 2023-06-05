#!/bin/bash
docker exec -u www-data -it nextcloud php occ maintenance:mode --off
