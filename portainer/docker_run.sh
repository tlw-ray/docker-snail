docker run \
-d \
-p 50380:9000 \
-v "/var/run/docker.sock:/var/run/docker.sock" \
-v ~/portainer/data:/data \
--name AP_Portainer \
--restart always \
portainer/portainer
pause
