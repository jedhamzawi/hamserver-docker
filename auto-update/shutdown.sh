for d in /home/hamsesh/docker/auto-update/*/ ; do
    cd "$d"
    docker compose down
done
