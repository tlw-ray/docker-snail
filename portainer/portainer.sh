#!/bin/bash
docker run -d -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" -v $PWD/data:/data --name portainer --restart always portainer/portainer-ce
