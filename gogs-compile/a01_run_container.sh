# usage:
# 1. Put this file under gogs source root directory. 
# 2. In container the workspace director use scripts/build.sh to build gogs
# 3. Mount sources.list to apt-get install
# 4. Envirnoment GOPROXY to proxy golang libary download
docker run -it -e GOPROXY=https://goproxy.io,direct -v $PWD/sources.list:/etc/apt/sources.list -v $PWD:/workspace golang:1.16.6-buster /bin/bash
