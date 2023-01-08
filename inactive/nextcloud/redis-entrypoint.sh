#!/bin/sh

redis-server --requirepass $(cat /run/secrets/nextcloud_redis_password)

