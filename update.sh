ROOT=/home/hamsesh/docker

for d in $ROOT/*/ ; do
    test "$d" = $ROOT/inactive/ && continue
    cd "$d"
    docker compose down
    docker compose pull
    docker compose up -d
done
docker system prune -af
echo "Update completed! $(date)" >> /var/log/docker/update.log
