for d in /home/hamsesh/docker/*/ ; do
    cd "$d"
    docker compose down
done
