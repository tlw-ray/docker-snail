docker run -d \
--name vscode \
--network host \
--cap-add=SYS_ADMIN \
-e DISPLAY \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
-v ${HOME}:/home/vscode \
alexandreoda/vscode
