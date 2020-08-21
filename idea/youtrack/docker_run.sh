docker run -it --name SV_YouTrack \
-v ${PWD}/data:/opt/youtrack/data \
-v ${PWD}/conf:/opt/youtrack/conf \
-v ${PWD}/logs:/opt/youtrack/logs \
-v ${PWD}/backups:/opt/youtrack/backups \
-p 8700:8080 \
jetbrains/youtrack:2019.3.65511
