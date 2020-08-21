docker run -it --name AP_YouTrack  \
    -v ~/tmp/youtrack/data:/opt/youtrack/data \
    -v ~/tmp/youtrack/conf:/opt/youtrack/conf  \
    -v ~/tmp/youtrack/logs:/opt/youtrack/logs  \
    -v ~/tmp/youtrack/backups:/opt/youtrack/backups  \
    -p 8702:8080 \
    -d \
    jetbrains/youtrack:2020.1.3588
