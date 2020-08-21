docker run -it --name SV_Upsource \
    -d \
    -v ~/tmp/upsource/data:/opt/upsource/data \
    -v ~/tmp/upsource/conf:/opt/upsource/conf  \
    -v ~/tmp/upsource/logs:/opt/upsource/logs  \
    -v ~/tmp/upsource/backups:/opt/upsource/backups  \
    -p 8700:8080 \
    jetbrains/upsource:2019.1.1644
