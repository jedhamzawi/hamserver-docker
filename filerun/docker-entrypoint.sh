#!/usr/bin/env bash

set -e

file_env() {
   local var="$1"
   local fileVar="${var}_FILE"
   local def="${2:-}"

   local val="$def"
   if [ "${!fileVar:-}" ]; then
      val="$(< "${!fileVar}")"
   fi
   export "$var"="$val"
   unset "$fileVar"
}

file_env "FR_DB_PASS"
/filerun/entrypoint.sh /usr/bin/supervisord -c /filerun/supervisord.conf
