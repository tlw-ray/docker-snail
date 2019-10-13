docker rm -f AP_SqliteAirflow
docker run \
--name AP_SqliteAirflow \
--restart always \
-d \
-p 8002:8080 \
-v /home/tlw/airflow:/data \
-e SQLITE_DATABASE="airflow.db" \
coleifer/sqlite-web
