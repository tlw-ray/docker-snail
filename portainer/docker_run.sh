docker run \
-d \
-p 50380:9000 \
-v /var/run/docker.socket:/var/run/docker.socket \
-v $PWD/data:/data \
--name AP_Portainer \
--restart always \
portainer/portainer
