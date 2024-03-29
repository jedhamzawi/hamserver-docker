#!/bin/bash

ROOT=/home/hamsesh/docker/auto-update

for d in $ROOT/*/ ; do
    test "$d" = $ROOT/manual-update/ && continue
    cd "$d"
    docker compose pull && docker compose up -d
done
docker system prune -af
echo "Update completed! $(date)" >> $ROOT/update.log
