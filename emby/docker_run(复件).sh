# KODI emby Miracast
docker run -d \
    --volume /path/to/programdata:/config \ # This is mandatory
    --volume /path/to/share1:/mnt/share1 \ # To mount a first share
    --volume /path/to/share2:/mnt/share2 \ # To mount a second share
    --device /dev/dri:/dev/dri \ # To mount all render nodes for VAAPI/NVDEC/NVENC
    #--runtime=nvidia \ # To expose your NVIDIA GPU
    --publish 8096:8096 \ # To expose the HTTP port
    --publish 8920:8920 \ # To expose the HTTPS port
    --env UID=1000 \ # The UID to run emby as (default: 2)
    --env GID=100 \ # The GID to run emby as (default 2)
    --env GIDLIST=100 \ # A comma-separated list of additional GIDs to run emby as (default: 2)
    emby/embyserver:latest
