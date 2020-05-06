docker run -it --name SV_Hub  \
    -v ~/tmp/hub/data:/opt/hub/data \
    -v ~/tmp/hub/conf:/opt/hub/conf  \
    -v ~/tmp/hub/logs:/opt/hub/logs  \
    -v ~/tmp/hub/backups:/opt/hub/backups  \
    -p 8701:8080 \
    -d \
    jetbrains/hub:2020.1.12157
