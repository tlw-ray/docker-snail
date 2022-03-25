docker run --name=gogs -d -p 3022:22 -p 3000:3000 -v $PWD/data:/data gogs/gogs:0.12.6
