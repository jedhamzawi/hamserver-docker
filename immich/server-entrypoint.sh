#!/bin/sh

set -e

export DB_USERNAME=$(cat /run/secrets/immich_db_user)
export DB_PASSWORD=$(cat /run/secrets/immich_db_password)
export DB_DATABASE_NAME=$(cat /run/secrets/immich_db_name)

/bin/sh ./start-server.sh
