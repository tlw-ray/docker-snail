docker run -d \
    --name SV_Emby \
    --volume $PWD/config:/config \
    --volume /home/tlw/film:/mnt/share1 \
    --volume $PWD/share2:/mnt/share2 \
    --device /dev/dri:/dev/dri \
    --publish 8096:8096 \
    --publish 8920:8920 \
    --env UID=1000 \
    --env GID=100 \
    --env GIDLIST=100 \
    emby/embyserver:latest
