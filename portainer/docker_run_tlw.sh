docker volume create portainer_data
docker run \
-d \
-p 9000:9000 \
-v /var/run/docker.socket:/var/run/docker.socket \
-v portainer_data:/data \
--name Portainer \
--restart always \
tlwtlw/portainer:20180518
